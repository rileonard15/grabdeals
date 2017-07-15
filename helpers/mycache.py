from django.core.cache import cache


def check_cache(key):
    cache_content = cache.get(key)
    return cache_content

def add_cache(key, data, xtime=60):
    this_cache = cache.set(key, data, xtime)
    return this_cache

def delete_cache(key):
    return cache.delete(key)

def generate_cache_key(code, item):
    key = code + "_" + item
    return key

