#!/usr/bin/env bash

echo "Creating Nginx site: $1"

SERVER_NAME=$1
SERVER_ROOT=$2
HTTP_PORT=$3
HTTPS_PORT=$4

AVAILABLE_CONF_FILENAME="/etc/nginx/sites-available/$SERVER_NAME.conf"
ENABLED_CONF_FILENAME="/etc/nginx/sites-enabled/$SERVER_NAME.conf"

sed -i "s|{{SERVER_NAME}}|$SERVER_NAME|g" $AVAILABLE_CONF_FILENAME
sed -i "s|{{SERVER_ROOT}}|$SERVER_ROOT|g" $AVAILABLE_CONF_FILENAME
sed -i "s|{{HTTP_PORT}}|$HTTP_PORT|g" $AVAILABLE_CONF_FILENAME
sed -i "s|{{HTTPS_PORT}}|$HTTPS_PORT|g" $AVAILABLE_CONF_FILENAME

ln -s $AVAILABLE_CONF_FILENAME $ENABLED_CONF_FILENAME
