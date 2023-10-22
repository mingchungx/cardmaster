import firebase_admin
from firebase_admin import credentials, firestore

cred = credentials.Certificate('../service_account_key.json')
firebase_admin.initialize_app(cred)

db = firestore.client()

def add_document(collection_name, data, document_id=None):
    # add document to collection - if documentid exists, use it
    if document_id:
        db.collection(collection_name).document(document_id).set(data)
    else:
        db.collection(collection_name).add(data)

def get_document(collection_name, document_id):
    doc = db.collection(collection_name).document(document_id).get()
    return doc.to_dict() if doc.exists else None

def update_document(collection_name, document_id, data):
    db.collection(collection_name).document(document_id).update(data)

def delete_document(collection_name, document_id):
    db.collection(collection_name).document(document_id).delete()

