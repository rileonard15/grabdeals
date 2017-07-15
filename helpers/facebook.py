import json
import urllib
import requests


class FacebookApi():
    def __init__(self, request):
        self.url_path = request.build_absolute_uri('/')
        self.page_token = "EAAHlaeFCZCskBAOzUl5jq63UzZCxhZAigPeDAlFAqrChr797tMkV2pJU0z4GnxCouUHvL4uSZCq0mPu4mdTF7EZALK1t0BeKVCsrFg3FiGe6V14dRkI6ZC62trql6aTZAoquJytzICXyVH9vZAtnFJRRIXYhq367xaqFh8lEWTfbZAQZDZD"

        if 'localhost' in self.url_path:
            self.redirect_uri = 'http://localhost:8888/me/'
            self.app_id = "390290381366648"
            self.app_secret = "7c0dbe6bb1b5d1ed752cc3fdde068eb1"
        else:
            self.redirect_uri = 'https://www.sellax.net/me/'
            self.app_id = "533717890301641"
            self.app_secret = "7e331effcc54272b7943b256b14598cd"

        print(self.redirect_uri)
        self.app_permission = ["email", "public_profile"]

    def generate_login_url(self):
        url = "https://www.facebook.com/v2.9/dialog/oauth?"
        url += "client_id=" + self.app_id
        url += "&redirect_uri=" + self.redirect_uri + "me/"
        url += "&state=" + "crosshair_301"
        url += "&scope=" + ",".join(self.app_permission)

        return url

    def code_to_access_token(self, code, state):
        if state != 'crosshair_301':
            raise Exception("404")

        url = "https://graph.facebook.com/v2.9/oauth/access_token"
        url += "?client_id=" + self.app_id
        url += "&redirect_uri=" + self.redirect_uri + "me/"
        url += "&client_secret=" + self.app_secret
        url += "&code=" + code

        response = urllib.request.urlopen(url)
        result = response.read().decode('utf8')
        obj = json.loads(result)

        return obj


    def get_user_details(self, token):
        url = "https://graph.facebook.com/me?"
        url += "fields=id,email,first_name,last_name,picture"
        url += "&access_token=" + token

        response = urllib.request.urlopen(url)
        result = response.read().decode('utf8')
        obj = json.loads(result)
        return obj

    def fb_send_message(self, fb_user_id, message=None, attachment=None):
        url = "https://graph.facebook.com/v2.6/me/messages"
        url += "?access_token=" + self.page_token

        content = dict()
        content['recipient'] = {
            "id": fb_user_id
        }
        if message:
            content['message'] = {
                "text": message
            }
        if attachment:
            content['message'] = attachment

        header = {'content-type': 'application/json'}
        print("sending message......")
        print(content)
        fb_request = requests.post(url, data=json.dumps(content), headers=header)
        return fb_request.text

    def start_payload(self):
        url = "https://graph.facebook.com/v2.6/me/thread_settings"
        url += "?access_token=" + self.page_token

        content = {
            "setting_type": "call_to_actions",
            "thread_state": "new_thread",
            "call_to_actions": [
                {
                    "payload": "XXX_101"
                }
            ]
        }
        header = {'content-type': 'application/json'}

        fb_request = requests.post(url, data=json.dumps(content), headers=header)
        return fb_request.text


    def add_greetings(self):
        url = "https://graph.facebook.com/v2.6/me/thread_settings"
        url += "?access_token=" + self.page_token

        content = {
            "setting_type": "greeting",
            "greeting": [
                {
                    "locale": "default",
                    "text": "Hi {{user_first_name}}!,"
                },
            ]
        }

        header = {'content-type': 'application/json'}

        fb_request = requests.post(url, data=json.dumps(content), headers=header)
        return fb_request.text
