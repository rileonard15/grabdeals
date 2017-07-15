# -*- coding: utf-8 -*-
# Python
import boto3
from email.header import Header
from celery.decorators import task

# ------------- Usage -----------------------

# from helpers.mailer import send_email
# send_email.delay('wazzzup', ['leonard.mark@hdestates.com'], 'the quick brown <b>fox</b>')


# ================================================================================================


@task(name='mailer')
def send_email(subject, to_address, msg, cc_addresses=[]):
    ses_client = boto3.client("ses", aws_access_key_id="AKIAJU5FY6V65TGFXS6A", aws_secret_access_key="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", region_name='us-west-2')

    email_source = '{0} <notification@phixer.net>'.format(Header('Notification', 'utf-8'))
    
    email_destination = {
        'ToAddresses': to_address,  # list
        'CcAddresses': cc_addresses,     # list
    }

    email_message = {
        'Subject': {
            'Data': subject,
            'Charset': '',
        },
        'Body': {
            'Html': {
                'Data': msg,
                'Charset': '',
            }
        }
    }

    try:
       result = ses_client.send_email(Source=email_source, Destination=email_destination, Message=email_message, ReturnPathArn='arn:aws:ses:us-west-2:113573308624:identity/phixer.net')
    except Exception as e:
        raise Exception(str(e))

    return result

