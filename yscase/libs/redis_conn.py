import logging

import redis
from django.conf import settings

logger = logging.getLogger(__name__)


class RedisConn(object):
    client = None
    channel_name = settings.PUB_SUB_CHANNEL

    def __init__(self):
        self.client = redis.Redis(host=settings.REDIS_HOST,
                                  port=settings.REDIS_PORT,
                                  password=settings.REDIS_PASS,
                                  socket_timeout=settings.REDIS_CONN_TIMEOUT)

    def pub(self, value):
        logger.info("[RedisConn] Starting Publishing")
        self.client.publish(self.channel_name, value)
        logger.info(f"[RedisConn] Completed Publishing for {value}")

    def sub(self):
        logger.info("[RedisConn] Starting Subscription")
        p = self.client.pubsub()
        p.psubscribe(self.channel_name)
        while True:
            message = p.get_message()
            if message and not message['data'] == 1:
                value = message['data'].decode('utf-8')
                logger.info(f"[RedisConn] Completed Subscription {value}")
                return value
            logger.info("[RedisConn] Waiting new order")
