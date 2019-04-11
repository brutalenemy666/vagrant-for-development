#!/usr/bin/env bash

# Check If SQLite 3 Has Been Installed
if [ -f /home/vagrant/.installed-sqlite3 ]
then
    echo "MySQL 8 already installed."
    exit 0
fi

touch /home/vagrant/.installed-sqlite3

apt-get -y install sqlite3
