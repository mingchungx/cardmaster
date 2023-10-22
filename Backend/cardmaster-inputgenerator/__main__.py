import random
from math import floor
import csv
#from dotenv import load_dotenv
#import os
#import cohere

#load_dotenv()

#client = os.getenv("CLIENT")
#co = cohere.Client(client)

#def generate_user():
#    """
#    generate_user() generates a row for the csv with user information
#    """
#    prompt = "Suppose you are writing a row in a csv file, where you must write in the format: username (string), travelFrequency (bool), travelInterest (bool), occupation (string), income (int), creditScore (string), budget (int). bool values must be written as 'true' or 'false', not 0 or 1. The occupation must be one of: student, earlyProfessional, midCareer, businessOwner, freelance, executive, unemployed. The creditScore must be one of: poor, fair, good, great, excellent. For example: johndoe23, false, true, student, 10000, fair, 200. Make sure it makes logical sense too - a person with a low income should not have a high budget - for example, if emilyjohnston42 makes 20000 a year in the INCOME field, they should not have their BUDGET at 500 a year, because maybe 20-50 as a budget a year makes more sense (dollars). Do not use any examples I gave, create your own. Your output must follow this format EXACTLY: username, travelFrequency, travelInterest, occupation, income, creditScore, budget. Do not write anything other than this list or follow up a question."
#
#    response = co.chat(
#        prompt,
#        model="command",
#        temperature=0.9
#    )
#
#    return response.text

def generate_user(i, house="low"):
    occupations = ["student", "earlyProfessional", "midCareer", "businessOwner", "freelance", "executive", "unemployed"]
    creditScores = ["poor", "fair", "good", "great", "excellent"]
    username = f"user{i}"
    travelFrequency = "true" if random.randint(0, 1) == 1 else "false"
    travelInterest = "true" if random.randint(0, 1) == 1 else "false"
    occupation = occupations[random.randint(0, len(occupations) - 1)]
    if house == "low":
        income = random.randint(0, 3) * 10000
    elif house == "med":
        income = random.randint(4, 9) * 10000
    elif house == "high":
        income = random.randint(10, 50) * 10000
    else:
        income = random.randint(51, 100) * 10000
    creditScore = creditScores[random.randint(0, len(creditScores) - 1)]
    budget = floor(income * 0.005)

    return [username, travelFrequency, travelInterest, occupation, income, creditScore, budget]

def writeRow(content):
    FILENAME = "users.csv"
    with open(FILENAME, mode='a', newline='\n') as file:
        writer = csv.writer(file)
        writer.writerow(content)

def main():
    lowIncomes = 15
    midIncomes = 25
    highIncomes = 8
    extremeIncomes = 2

    for i in range(lowIncomes):
        user = generate_user(i, "low")
        writeRow(user)
    for i in range(lowIncomes, lowIncomes + midIncomes):
        user = generate_user(i, "med")
        writeRow(user)
    for i in range(lowIncomes + midIncomes, lowIncomes + midIncomes + highIncomes):
        user = generate_user(i, "high")
        writeRow(user)
    for i in range(lowIncomes + midIncomes + highIncomes, lowIncomes + midIncomes + highIncomes + extremeIncomes):
        user = generate_user(i, "extreme")
        writeRow(user)
    


if __name__ == "__main__":
    main()
