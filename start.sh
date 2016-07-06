#!/bin/bash

export APACHE_RUN_USER=${APACHE_RUN_USER:-www-data}
export APACHE_RUN_GROUP=${APACHE_RUN_GROUP:-www-data}
export APACHE_LOG_DIR=${APACHE_LOG_DIR:-/var/log/apache2}
export APACHE_PID_FILE=${APACHE_PID_FILE:-/var/run/apache2.pid}
export APACHE_RUN_DIR=${APACHE_RUN_DIR:-/var/run/apache2}
export APACHE_LOCK_DIR=${APACHE_LOCK_DIR:-/var/lock/apache2}
export APACHE_SERVERADMIN=${APACHE_SERVERADMIN:-admin@localhost}
export APACHE_SERVERNAME=${APACHE_SERVERNAME:-localhost}

export POSTGRES_DEFAULTDB=${POSTGRES_DEFAULTDB:-defaultdb}
export POSTGRES_HOST=${POSTGRES_HOST:-localhost}
export POSTGRES_PORT=${POSTGRES_PORT:-5432}

# Handle --link mydb:postgres
if [ -n "$POSTGRES_PORT_5432_TCP_ADDR" ]; then
    export POSTGRES_HOST=$POSTGRES_PORT_5432_TCP_ADDR
    export POSTGRES_PORT=$POSTGRES_PORT_5432_TCP_PORT
fi
if [ -n "$POSTGRES_ENV_POSTGRES_DB" ]; then
    export POSTGRES_DEFAULTDB=$POSTGRES_ENV_POSTGRES_DB
fi

# Start apache
/usr/sbin/apache2 -D FOREGROUND
