from exec_eval import result_eq
from exec_eval import exec_on_db

import os
import asyncio

def get_test_suites(database_path):
    db_files = []
    for root, dirs, files in os.walk(database_path):
        for file in files:
            file_path = os.path.join(root, file)
            db_files.append(file_path)
    db_files.sort()
    return db_files


if __name__ == '__main__':
    db_id = "concert_singer"
    database_path = 'database/%s/' % db_id
    db_files = get_test_suites(database_path)

    gold_sql = "SELECT COUNT(*) FROM (SELECT DISTINCT name, country, song_name, age FROM singer)"
    pred_sql = "SELECT count(*) FROM singer"
    order_matters = 'ORDER BY' in str(gold_sql).upper() or 'ORDER BY' in str(pred_sql).upper()
    print("order_matters?", order_matters)
    eq = True
    for db_file in db_files:
        gold_flag, gold_denotation = asyncio.run(exec_on_db(db_file, gold_sql))
        pred_flag, pred_denotation = asyncio.run(exec_on_db(db_file, pred_sql))
        eq = result_eq(gold_denotation, pred_denotation, order_matters=order_matters)
        if not eq:
            print(db_file)
            break
