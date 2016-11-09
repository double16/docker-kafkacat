#!/bin/sh

docker build -t kafkacat_build . || exit 1

source $(dirname $0)/sh2ju.sh
juLogClean

juLog -name="list options" docker run kafkacat_build -X list

