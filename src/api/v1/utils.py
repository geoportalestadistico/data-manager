import time
from datetime import datetime
from django.utils.timezone import utc
from django.conf import settings


def get_time_diff(request_time):
    if request_time:
        now = datetime.utcnow().replace(tzinfo=utc)
        timediff = now - request_time
        return timediff.total_seconds()


def get_footer(request, records, request_started_at):
    return {
        "records": records,
        "elapsed_time": get_time_diff(request_started_at),  # g.request_time(),
        "ip": request.META["REMOTE_ADDR"],  # request.environ.get("HTTP_X_REAL_IP", request.remote_addr),
        "query": request.build_absolute_uri(),  # request.url,
    }


def get_header(success, code, message=""):
    header_data = {}
    header_data["name"] = settings.APP_NAME
    header_data["version"] = settings.APP_VERSION
    header_data["success"] = success
    header_data["machine"] = settings.MACHINE
    header_data["context"] = settings.CONTEXT
    header_data["code"] = code
    header_data["message"] = message
    header_data["timestamp"] = int(time.time())
    return header_data
