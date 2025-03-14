#!/bin/bash
set -e

echo $(java -version)

java -Dreactor.schedulers.defaultBoundedElasticOnVirtualThreads=true -jar build/libs/jvm_reactor_test-*.jar

