from dotenv import load_dotenv
import os
import cohere


load_dotenv()

client = os.getenv("CLIENT")
co = cohere.Client(client)


def promptModify(msg):
    """
    promptModify(msg) modifies msg with prompt engineering for strong natural language output.
        * In this case, it modifies msg to give financial advice.
    """

    modified = f"SUPPOSE YOU ARE A FINANCIAL ADVISOR. YOU ARE TASKED WITH GIVING CREDIT CARD ADVICE TO A PERSON, WHO SENDS YOU A QUESTION msg. IF THE QUESTION msg IS NOT RELATED TO FINANCE, REPOND SIMPLY WITH 'Sorry, I can only help with finance questions, are there any other finance questions you need help with?' OTHERWISE (THE QUESTION IS RELATED TO FINANCE), I WANT YOU TO GIVE THE ADVICE AS IF YOU ARE A FINANCIAL ADVISOR.: msg = ({msg})"

    return modified


def respond(msg, chat_history):
    """
    respond(msg, chat_history) uses the Cohere API to generate a response.
    """
    if not msg:
        return "Please enter a message."
    
    msg = promptModify(msg)

    response = co.chat(
        msg,
        model="command",
        temperature=0.3,
        chat_history=chat_history
    )

    return response.text
