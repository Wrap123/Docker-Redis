#!/bin/bash

if [ -e /home/redis.setup ];
    then
      echo "Already setup redis,start . . ."
else
    echo "Setup redis. . . "
     redis-server /home/redis/conf/redis.conf
      touch /home/redis.setup
fi

tail -f /home/redis/redis.log
