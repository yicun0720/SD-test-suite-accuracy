import json

with open("dev_gold_fixed_ambiguity.json", "r") as f:
    cases = json.load(f)
count = 0
for case in cases:
    if len(case["gold"]) > 1:
        count += 1
print(count)
