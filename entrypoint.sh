#!/bin/bash
set -e

java -Dreactor.schedulers.defaultBoundedElasticOnVirtualThreads=true -jar test-jvm-latest.jar

