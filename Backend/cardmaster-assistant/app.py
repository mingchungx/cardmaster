from flask import Flask, request, jsonify
import src.assistant as assistant


app = Flask(__name__)

chat_history = []


@app.route("/respond", methods=["GET"])
def assistant_respond():
    msg = request.args.get('msg')
    res = assistant.respond(msg, chat_history)

    # Add to chat_history
    user_message = {
        "user_name": "User", 
        "text": msg
        }
    
    assistant_message = {
        "user_name": "Assistant", 
        "text": res
        }
    
    chat_history.append(user_message)
    chat_history.append(assistant_message)

    json = {"response": res}
    return jsonify(json)


if __name__ == '__main__':
    app.run(port=8001, debug=True)
