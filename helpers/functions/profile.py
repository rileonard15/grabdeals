from helpers.serializers import serialize as s


class ProfileInstance():
    def __init__(self, data=None):

        if data:
            self.instance = dict()
            self.instance['address'] = data["address"]
            self.instance['mobile'] = data["mobile"]
            self.instance['telno'] = data["telno"]
            self.instance['user'] = data["user"]
            self.instance['fb_accesstoken'] = data["fb_accesstoken"]
            self.instance['fb_id'] = data["fb_id"]

    def create_profile(self):
        serializer = s.ProfileSerializer(data=self.instance)
        if serializer.is_valid():
            serializer.save()

        return serializer.data

    @classmethod
    def format_profile_data(cls, data, user_obj):
        item = dict()

        item["address"] = data.get('address', None)
        item["mobile"] = data.get('mobile', None)
        item["telno"] = data.get('telno', None)
        item["user"] = user_obj.id
        item["fb_accesstoken"] = data.get('fb_accesstoken', None)
        item["fb_id"] = data.get('fb_id', None)
        print(item)
        return cls(item)
