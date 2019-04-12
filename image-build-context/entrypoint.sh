#!/bin/bash

if [[ -f /ssh/id_rsa.pub ]]
then
    PUBLIC_KEY=$(cat /ssh/id_rsa.pub)
    /add_public_key.sh "${PUBLIC_KEY}"
fi

exec supervisord --nodaemon
