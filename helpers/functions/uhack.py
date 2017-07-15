import requests, json

client_id = "c599be9f-f833-4f01-89bc-56d4c8bb1921"
secret_key = "H5yK2yG4uX6bQ7uM3mN4vP1dG0qO0yN4wH7rA4aK7aF6hK7pB3"


def pay_amount(payment_data):
    url = "https://api-uat.unionbankph.com/uhac/sandbox/transfers/initiate"

    body = {
        "channel_id": "UHAC_TEAM",
        "transaction_id": payment_data['transaction_id'],
        "source_account": payment_data['source'],
        "source_currency": "PHP",
        "target_account": "11111111112",
        "target_currency": "PHP",
        "amount": payment_data['amount']
    }

    headers = {
        'x-ibm-client-id': client_id,
        'x-ibm-client-secret': secret_key,
        'content-type': "application/json",
        'accept': "application/json"
    }

    response = requests.post(url, data=json.dumps(body), headers=headers)
    print(response.text)

    return response.text
