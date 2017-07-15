from django.contrib.auth import login, logout

from celery.decorators import task


@task(name="add_logs")
def add(msg):
    message = ""
    # if request.user.is_authenticated():
    #     message += "<uid:" + str(request.user.id) + "> "
    # log.message = message
    # log.save()

    try:
        message += msg    
    except Exception as e:
        raise Exception(str(e) + " wahahaha")
    print(message)

    return True

