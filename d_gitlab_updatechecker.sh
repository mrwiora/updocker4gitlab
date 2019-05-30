#!/usr/bin/env bash
cd "$(dirname "$0")"
DT=$(date '+%d/%m/%Y %H:%M:%S');
set -e
BASE_IMAGE="gitlab/gitlab-ce:latest"
REGISTRY="registry.hub.docker.com"
IMAGE="$REGISTRY/$BASE_IMAGE"
CID=$(docker ps | grep $BASE_IMAGE | awk '{print $1}')
docker pull $IMAGE

for im in $CID
do
    LATEST=`docker inspect --format "{{.Id}}" $IMAGE`
    RUNNING=`docker inspect --format "{{.Image}}" $im`
    NAME=`docker inspect --format '{{.Name}}' $im | sed "s/\///g"`
    echo "Latest:" $LATEST
    echo "Running:" $RUNNING
    if [ "$RUNNING" != "$LATEST" ];then
        echo "upgrading $NAME"
	./d_gitlab_update.sh $im 
    else
        echo "$NAME up to date"
    fi
done
echo $DT
echo $DT > ~/lastexec
