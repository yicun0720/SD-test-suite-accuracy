import argparse
import json, os
import traceback
import sqlglot

from process_sql import get_schema, Schema, get_sql
from evaluation import Evaluator


def evaluate(args):
    with open(args.data_file_path, 'r') as f:
        data = json.load(f)

    evaluator = Evaluator()

    unknown_ids = []
    counts = {}
    counts_0_499 = {}
    for case in list(data):
        case_id = data.index(case)
        print(f"Processing case {case_id}")

        sql = case['query'] if args.benchmark == 'spider' else case['SQL']
        db_id = case['db_id']
        db_path = os.path.join(args.schema_db_dir, db_id, db_id + ".sqlite")
        if not os.path.exists(db_path):
            db_path = os.path.join(args.schema_db_dir, db_id, db_id + "_0.sqlite")

        schema = Schema(get_schema(db_path))
        hardness = ''
        try:
            # if args.benchmark == 'bird':
            #     sql = sql.replace('INNER JOIN', 'JOIN').replace('inner join', 'JOIN')
            sql = sql.replace('`', '"')
            hardness = evaluator.eval_hardness(get_sql(schema, sql)) if args.benchmark == 'spider' \
                else evaluator.eval_hardness_sqlglot(sql)
        except Exception as e:
            # traceback.print_exc()
            print(f"Exception in {case_id}: ", e)
            hardness = 'Unknown'
            unknown_ids.append(case_id)
        finally:
            print(hardness)
            case['difficulty'] = hardness
            counts[hardness] = counts.get(hardness, 0) + 1
            if 0 <= case_id <= 499:
                counts_0_499[hardness] = counts_0_499.get(hardness, 0) + 1

    print(len(unknown_ids), unknown_ids)

    print(counts)
    print(counts_0_499)
    print(counts['easy'] / len(data), counts['medium'] / len(data), counts['hard'] / len(data), counts['extra'] / len(data))
    print(counts_0_499['easy'] / 500, counts_0_499['medium'] / 500, counts_0_499['hard'] / 500, counts_0_499['extra'] / 500)

    with open(args.save_data_file_path, 'w') as f:
        json.dump(data, f, indent=4)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    parser.add_argument("--data_file_path", type=str, required=True)
    parser.add_argument("--save_data_file_path", type=str, required=True)
    parser.add_argument("--schema_db_dir", type=str, required=True)
    parser.add_argument("--benchmark", type=str, choices=['spider', 'bird'], default='spider')

    args = parser.parse_args()

    evaluate(args)
