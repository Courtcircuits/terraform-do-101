import json
import boto3
import os

client = boto3.client('sns')

def lambda_handler(event, context):
    return test(event, context)
    
def test(event, context):
    message = event["message"] + " - " + os.environ['EMAIL_NOTIFICATION']
    arn = os.environ['SNS_TOPIC_ARN']
    print(message)
    response = client.publish(
        TopicArn=arn,
        Message=message,
        Subject='Test'
    )
    return response