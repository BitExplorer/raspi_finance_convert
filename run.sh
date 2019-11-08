#!/bin/sh

mkdir -p logs ssl json_in
HOST_BASEDIR=$(pwd)
GUEST_BASEDIR=/opt/raspi_finance_convert
#HOST_IP=$(ifconfig getifaddr en0)
HOST_IP=$(hostname -I | awk '{print $1}')
export LOGS=$BASEDIR/logs
touch env
echo ./mvnw package -Dmaven.test.skip=true
echo gradle wrapper --gradle-version 5.6.2 --distribution-type all
./gradlew clean build
docker build -t raspi_finance_convert .
docker run -it -h raspi_finance_convert --add-host hornsup:$HOST_IP -p 8080:8080 --env-file env.secrets --env-file env -rm -v $HOST_BASEDIR/logs:$GUEST_BASEDIR/logs -v $HOST_BASEDIR/ssl:$GUEST_BASEDIR/ssl -v $HOST_BASEDIR/json_in:$GUEST_BASEDIR/json_in --rm --name raspi_finance_convert raspi_finance_convert

exit 0
