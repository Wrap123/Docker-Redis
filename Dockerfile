From centos:6.9_update

MAINTAINER byz "byuezu@extremevalue.cn"

WORKDIR /home

RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && mkdir -p /home/redis/{conf,data} \
    && tar zxf /home/redis-5.0.4.tar.gz -C /home/redis\
    && make -C /home/redis/redis-5.0.4 \
    && cd /home/redis/redis-5.0.4/src \
    && make install PREFIX=/home/redis \
    && cp /home/redis/redis-5.0.4/src/{redis-server,redis-cli,redis-sentinel,redis-benchmark,redis-check-aof} /usr/bin \
    && cp -f /home/redis/redis-5.0.4/*.conf /home/redis/conf \
    && rm -rf /home/redis/redis-5.0.4* \
    && yum clean all

ADD redis.conf /home/redis/conf/
ADD run.sh /home/run.sh

EXPOSE 6379

CMD ["/home/run.sh"]
