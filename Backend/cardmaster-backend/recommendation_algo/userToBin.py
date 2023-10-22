import pandas as pd, csv

"""
CSV Format

username,travelFreq,travelInterest,occupation,income,creditScore,budget
"""

# Similarity of users
"""
Data representation:
travel freq: bool
travel interest: bool
occupations- student, early professional, mid-career, business owner, freelance, executive, unemployed 
credit score- poor, fair, good, great, excellent
income
budget
tags

liked cards
disliked cards
"""

"""student - occupation:student"""
"""business - occupation:business owner,freelance,executive"""
"""travel - moderate-high travel freq; moderate-high travel interest"""
"""elite - occupation:mid-career,business owner,executive ; credit score: great,exellent ; income:100 000+ ; budget:100+"""
users = pd.read_csv("users.csv")
fobj = open("bin_users.csv", "w")
fieldnames = [
    "username",
    "fingerprint",
    "United Quest℠ Card",
    "American Express® Gold Card",
    "Visa Signature® Flagship Rewards Credit Card",
    "Capital One Venture Rewards Credit Card",
    "Amazon Business Prime American Express Card",
    "Hilton Honors Business Card",
    "Blue Cash Preferred® Card from American Express",
    "Chase Freedom Unlimited®",
    "Capital One Quicksilver Student Cash Rewards Credit Card",
    "Costco Anywhere Visa Card by Citi",
    "United℠ Business Card",
    "Discover it® Student Chrome",
    "Wyndham Rewards Earner® Card",
    "PenFed Pathfinder® Rewards Visa Signature® Card",
    "Discover it® Student Cash Back",
    "Chase Sapphire Preferred",
    "Discover it® Cash Back",
    "The Ink Business Cash® Credit Card",
    "Chase Sapphire Reserve",
    "BankAmericard® Credit Card",
]  # TODO fill this in
refined_users = csv.DictWriter(fobj, fieldnames=fieldnames)
refined_users.writeheader()
occupations = [
    "student",
    "earlyProfessional",
    "midCareer",
    "businessOwner",
    "freelance",
    "executive",
    "unemployed",
]
credit_ranges = ["poor", "fair", "good", "great", "excellent"]


def userToBin(occupation, travelFrequency, travelInterest, creditScore, income, budget):
    user_fingerprint = ""
    user_fingerprint += str(int(occupation == occupations[0]))
    user_fingerprint += str(int(occupation in occupations[3:6]))
    user_fingerprint += str(int(travelFrequency or travelInterest))
    user_fingerprint += str(
        int(
            budget >= 100
            and (
                (occupation in occupations[2:4] + [occupations[5]])
                or creditScore in credit_ranges[3:]
                or income >= 100000
            )
        )
    )
    return user_fingerprint


for (
    idx,
    row,
) in users.iterrows():
    # Binary representation of user's associated tags
    # [student,business,travel,elite]
    user_fingerprint = userToBin(
        row["occupation"],
        row["travelFrequency"],
        row["travelInterest"],
        row["creditScore"],
        row["income"],
        row["budget"],
    )
    # Dump into another csv file
    refined_users.writerow(
        {
            "username": row["username"],
            "fingerprint": user_fingerprint,
            "United Quest℠ Card": row["United Quest℠ Card"],
            "American Express® Gold Card": row["American Express® Gold Card"],
            "Visa Signature® Flagship Rewards Credit Card": row[
                "Visa Signature® Flagship Rewards Credit Card"
            ],
            "Capital One Venture Rewards Credit Card": row[
                "Capital One Venture Rewards Credit Card"
            ],
            "Amazon Business Prime American Express Card": row[
                "Amazon Business Prime American Express Card"
            ],
            "Hilton Honors Business Card": row["Hilton Honors Business Card"],
            "Blue Cash Preferred® Card from American Express": row[
                "Blue Cash Preferred® Card from American Express"
            ],
            "Chase Freedom Unlimited®": row["Chase Freedom Unlimited®"],
            "Capital One Quicksilver Student Cash Rewards Credit Card": row[
                "Capital One Quicksilver Student Cash Rewards Credit Card"
            ],
            "Costco Anywhere Visa Card by Citi": row[
                "Costco Anywhere Visa Card by Citi"
            ],
            "United℠ Business Card": row["United℠ Business Card"],
            "Discover it® Student Chrome": row["Discover it® Student Chrome"],
            "Wyndham Rewards Earner® Card": row["Wyndham Rewards Earner® Card"],
            "PenFed Pathfinder® Rewards Visa Signature® Card": row[
                "PenFed Pathfinder® Rewards Visa Signature® Card"
            ],
            "Discover it® Student Cash Back": row["Discover it® Student Cash Back"],
            "Chase Sapphire Preferred": row["Chase Sapphire Preferred"],
            "Discover it® Cash Back": row["Discover it® Cash Back"],
            "The Ink Business Cash® Credit Card": row[
                "The Ink Business Cash® Credit Card"
            ],
            "Chase Sapphire Reserve": row["Chase Sapphire Reserve"],
            "BankAmericard® Credit Card": row["BankAmericard® Credit Card"],
        }
    )

fobj.close()

# Tags: student (based on occupation),
# business (based on occupation),
# travels (based on travel freq and travel interest),
# cash back (everyone),
# elite (based on occupations, credit score, income, budget),
# store (recommended to everyone; user filters out whether or not they want to see it)


# Card recommendations based on similar users
