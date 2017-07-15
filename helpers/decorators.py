# Decorators
def user_permission(groups):
    def _dec(fn):
        def check_permission(self, *args, **kwargs):
            if self.request.user.is_authenticated():
                if str(self.request.user.groups.all()[0]) in groups:
                    return fn(self, *args, **kwargs)
            return self.render(self.request, '404.html')
        return check_permission
    return _dec


def validate_required_fields(required):
    def _dec(fn):
        def check_fields(self, *args, **kwargs):
            for r in required:
                item = self.request.data.get(r, None)
                if not item:
                    return self.api_response(400, "(" + str(r).upper() + ") is field is required ")
                if item == None or self.request.data[r] == "":
                    return self.api_response(400, "(" + str(r).upper() + ") is field is required ")
            return fn(self, *args, **kwargs)

        return check_fields
    return _dec
