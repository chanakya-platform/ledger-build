#!/bin/sh
# -------------------------- #
# Author: Soni A 
# chanakyaTECH - +91-97397*****
# -------------------------- #

set -e 
echo "Setting the configuration file application to start .."
cat /opt/chanakya/application.properties.orig > application.properties
cat /vault/secrets/databaseenv.txt >> application.properties

echo "Starting chanakyatech Springboot application ..."
echo "command: java -jar app.jar $@"
exec java -jar app.jar "$@"
