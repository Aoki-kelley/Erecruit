import time
from django.core import signing
import hashlib
from django.core.cache import cache

HEADER = {'typ': 'JWP', 'alg': 'default'}
KEY = 'token_key'
SALT = 'django_secret_salt'
TIME_OUT = 30 * 60  # 30min


def encrypt(data: dict):
    """
    加密,data为待加密的数据,格式统一为{'email':'xxx@xx.xxx'}
    """
    value = signing.dumps(data, key=KEY, salt=SALT)
    value = signing.b64_encode(value.encode()).decode()
    return value


def decrypt(src):
    """
    解密,src为token字符串
    """
    src = signing.b64_decode(src.encode()).decode()
    raw = signing.loads(src, key=KEY, salt=SALT)
    # print(type(raw))
    return raw


def create_token(email: str):
    """
    生成token信息,email为请求token的用户邮箱
    """
    # 1. 加密头信息
    header = encrypt(HEADER)
    # 2. 构造Payload
    payload = {"email": email, "iat": time.time()}
    payload = encrypt(payload)
    # 3. 生成签名
    md5 = hashlib.md5()
    md5.update(("%s.%s" % (header, payload)).encode())
    signature = md5.hexdigest()
    token = "%s.%s.%s" % (header, payload, signature)
    # 存储到缓存中
    cache.set(email, token, TIME_OUT)
    return token


def get_payload(token):
    payload = str(token).split('.')[1]
    payload = decrypt(payload)
    return payload


# 通过token获取邮箱
def get_email(token):
    payload = get_payload(token)
    return payload['email']


def check_token(token):
    email = get_email(token)
    last_token = cache.get(email)
    if last_token:
        return last_token == token
    return False
