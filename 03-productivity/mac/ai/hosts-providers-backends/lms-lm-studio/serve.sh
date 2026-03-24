#!/bin/bash

source "${BASH_SOURCE%/*}/../ports.sh"

lms \
    server \
        start \
            --port $LMS_SERVER_PORT
