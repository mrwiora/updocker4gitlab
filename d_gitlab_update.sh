#!/bin/bash
if [ -z "$1" ]; then
    echo "Please provide the old gitlab containerid to archive the docker image as parameter 1"
else
    docker stop gitlab
    docker rename gitlab gitlab_$1
    ./d_gitlab_start.sh
fi
