import json


def lambda_handler(event, context):
    # Extracting the "message" from the event object.
    message = event.get("message", "Hello from Lambda")

    # Constructing the response as an array of arrays with the message
    response_data = [[0, message]]

    # Creating the final response object
    response = {"data": response_data}

    # Returning the JSON response
    return {
        "statusCode": 200,
        "body": json.dumps(response),
        "headers": {"Content-Type": "application/json"},
    }
