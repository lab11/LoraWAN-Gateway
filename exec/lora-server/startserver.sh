#!/bin/bash

# /opt/redis/redis-server /opt/redis/redis.config

#./semtech-bridge&

./loraserver --db-automigrate --net-id 010203 --postgres-dsn "postgres://loraserver:dbpassword@localhost/loraserver?sslmode=disable" --band US_902_928
