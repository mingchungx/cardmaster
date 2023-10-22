import json
import uuid
from firestore_opperations import add_document

with open('../data.json', 'r') as file:
    data_list = json.load(file)

for data in data_list:
    data['ID'] = str(uuid.uuid4())
    add_document('credit_card', data)