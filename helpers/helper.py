import random
import string
import datetime
import pytz
import boto3

from email.header import Header
from celery.decorators import task


def generate_id(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


def generate_digit(size=4, chars=string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


def get_username_code(username):
    str_list = username.split('-')
    return str_list[1]


def get_user_name(user):
    name = user.first_name + " " + user.last_name
    return name


def format_to_nice_date(date):
    return date.strftime('%B %d, %Y on %I:%M %p')

def format_to_day(date):
    return date.strftime('%A')

def today_date_with_tz(tz_string):
    tz = pytz.timezone(tz_string)
    date_now = datetime.datetime.utcnow()
    date_now = date_now.replace(tzinfo=pytz.utc)
    date_with_tz = date_now.astimezone(tz)

    return date_with_tz


def first_and_last_name(fullname):
    name = fullname.split(' ')
    name_len = len(name)

    first_name = ""
    last_name = ""
    x = 1
    for n in name:
        if x == name_len:
            last_name = n
        else:
            first_name += n + " "
        x = x + 1

    return first_name.strip().title(), last_name.title()

def tag_converter(name):
    return name.strip().replace(' ', '_').lower()


def item_page(page=None, limit=None):
    if page == None:
        page = 0
    if limit == None:
        limit = 20

    page = int(page)
    limit = int(limit)

    offset = page * limit
    upto = offset + limit

    return offset, upto


@task(name='send_mail')
def send_email(email_data):
    ses_client = boto3.client("ses", aws_access_key_id="AKIAJU5FY6V65TGFXS6A",
                              aws_secret_access_key="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",
                              region_name='us-west-2')
    email_source = '{0} <notification@phixer.net>'.format(Header('Notification', 'utf-8'))
    email_destination = {
        'ToAddresses': email_data['to_address'],  # list
        'CcAddresses': email_data['cc_addresses'],     # list
    }
    email_message = {
        'Subject': {
            'Data': email_data['subject'],
            'Charset': '',
        },
        'Body': {
            'Html': {
                'Data': email_data['email_content'],
                'Charset': '',
            }
        }
    }

    try:
       result = ses_client.send_email(Source=email_source,
                                      Destination=email_destination,
                                      Message=email_message,
                                      ReturnPathArn='arn:aws:ses:us-west-2:113573308624:identity/phixer.net')
    except Exception as e:
        raise Exception(str(e))

    return result
