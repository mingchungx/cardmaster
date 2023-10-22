from collections import defaultdict
import csv

with open("bin_users.csv") as file:
    counts = defaultdict(int)
    reader = csv.DictReader(file)
    for line in reader:
        counts[line["fingerprint"]] += 1
print(counts)
