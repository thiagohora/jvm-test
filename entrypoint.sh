#!/bin/bash
set -e

echo $(java -version)

java -Dreactor.schedulers.defaultBoundedElasticOnVirtualThreads=true -jar target/test-jvm-*.jar

