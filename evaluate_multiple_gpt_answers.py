import os
import json
import argparse

from tqdm import tqdm
from process_sql import get_schema, Schema, get_sql
from exec_eval import eval_exec_match


def parse_option():
    parser = argparse.ArgumentParser("command line arguments for evaluate multiple sqls")

    parser.add_argument("--input_dataset_path", default="./evaluation_examples/dev_pred_C3_multiple_answer.json", type=str)
    parser.add_argument("--input_original_result_path", default="./result/result_exec_C3.txt", type=str)
    # parser.add_argument("--output_dataset_path", default="./multiple_gpt_answers_wrong_cases.json", type=str)

    parser.add_argument('--db', dest='db', type=str,
                        help="the directory that contains all the databases and test suites",
                        default="./database")
    parser.add_argument('--table', dest='table', type=str,
                        help="the tables.json schema file",
                        default="./tables.json")
    # parser.add_argument('--etype', dest='etype', type=str, default='exec',
    #                     help="evaluation type, exec for test suite accuracy, match for the original exact set match accuracy",
    #                     choices=('all', 'exec', 'match'))
    parser.add_argument('--plug_value', default=False, action='store_true',
                        help='whether to plug in the gold value into the predicted query; suitable if your model does not predict values.')
    parser.add_argument('--keep_distinct', default=True, action='store_true',
                        help='whether to keep distinct keyword during evaluation. default is false.')
    parser.add_argument('--progress_bar_for_each_datapoint', default=False, action='store_true',
                        help='whether to print progress bar of running test inputs for each datapoint')

    parser.add_argument("--start", type=int, default=-1)
    parser.add_argument("--end", type=int, default=-1)

    return parser.parse_args()


if __name__ == '__main__':
    opt = parse_option()
    print(opt)

    with open(opt.input_dataset_path) as f:
        replies = json.load(f)

    with open(opt.input_original_result_path) as f:
        original_results = [int(line.split("\t")[0]) for line in f.readlines() if line.startswith("0") or line.startswith("1")]

    wrong_cases = [i for i in range(len(original_results)) if original_results[i] == 0]
    correct_cases = [i for i in range(len(original_results)) if original_results[i] == 1]
    wrong_case_num = len(wrong_cases)
    correct_case_num = len(correct_cases)

    hit_times = {}
    for i, item in enumerate(tqdm(replies)):
        case_id, db_id, gold_sql = item["id"], item["db_id"], item["gold"]
        gpt_answers1, gpt_answers2, gpt_answers3 = item["gpt_answers1"], item["gpt_answers2"], item["gpt_answers3"]

        if opt.start >= 0 and case_id < opt.start:
            continue
        if opt.end >= 0 and case_id > opt.end:
            break

        if case_id in correct_cases:  # Originally correct prediction
            continue

        db = os.path.join(opt.db, db_id, db_id + ".sqlite")  # db: database/concert_singer/concert_singer.sqlite

        res1, res2, res3 = False, False, False
        for answer in gpt_answers1:
            exec_score = eval_exec_match(db=db, p_str=answer, g_str=gold_sql, plug_value=opt.plug_value,
                                         keep_distinct=opt.keep_distinct,
                                         progress_bar_for_each_datapoint=opt.progress_bar_for_each_datapoint)
            if exec_score:
                res1 = True
                break
        for answer in gpt_answers2:
            exec_score = eval_exec_match(db=db, p_str=answer, g_str=gold_sql, plug_value=opt.plug_value,
                                         keep_distinct=opt.keep_distinct,
                                         progress_bar_for_each_datapoint=opt.progress_bar_for_each_datapoint)
            if exec_score:
                res2 = True
                break
        for answer in gpt_answers3:
            exec_score = eval_exec_match(db=db, p_str=answer, g_str=gold_sql, plug_value=opt.plug_value,
                                         keep_distinct=opt.keep_distinct,
                                         progress_bar_for_each_datapoint=opt.progress_bar_for_each_datapoint)
            if exec_score:
                res3 = True
                break

        hit_times[case_id] = int(res1) + int(res2) + int(res3)
        print("case id: %d, hit_times: %d" % (case_id, hit_times[case_id]))

    hit_all = sum([int(hit_times[case_id] == 3) for case_id in wrong_cases])
    hit_twice = sum([int(hit_times[case_id] == 2) for case_id in wrong_cases])
    hit_once = sum([int(hit_times[case_id] == 1) for case_id in wrong_cases])

    print("hit 3/3: %d, %f" % (hit_all, (hit_all / wrong_case_num)))
    print("hit 2/3: %d, %f" % (hit_twice, (hit_twice / wrong_case_num)))
    print("hit 1/3: %d, %f" % (hit_once, (hit_once / wrong_case_num)))
    total = hit_all + hit_twice + hit_once
    print("can hit: %d, %f" % (total, (total / wrong_case_num)))
