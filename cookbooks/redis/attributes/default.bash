#!/bin/bash

redisDownloadURL='http://download.redis.io/releases/redis-stable.tar.gz'

redisServiceName='redis'

redisUID='redis'
redisGID='redis'

redisPort=6379

redisInstallBinFolder='/opt/redis/bin'
redisInstallConfigFolder='/opt/redis/config'
redisInstallDataFolder='/opt/redis/data'

redisSoftNoFileLimit=50000
redisHardNoFileLimit=50000

redisVMOverCommitMemory=1