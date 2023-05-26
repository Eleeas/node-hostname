#!/bin/bash

DOCKER_USR=eliaspias
DOCKER_REPO=test
DOCKER_TAG=latest

usage() {
  echo "Usage: $0 -p password [-t docker_tag] [-r docker_repo] [-u docker_usr]"
  echo "  -p password   Specify the password to use"
  echo "  -t docker_tag Specify the Docker tag to use"
  echo "  -r docker_repo Specify the Docker repository to use"
  echo "  -u docker_usr Specify the Docker username"
  echo ""
  echo "  DEFAULTS -u $DOCKER_USR -r $DOCKER_REPO -t $DOCKER_TAG"
  exit 1
}

while getopts ":p:" opt; do
  case $opt in
    p) password=$OPTARG;;
    t) DOCKER_TAG=$OPTARG;;
    r) DOCKER_REPO=$OPTARG;;
    u) DOCKER_USR=$OPTARG;;
    h) usage;;
    \?) usage;;
  esac
done

if [ -z "$password" ]; then
  usage
fi

# Build the Docker image
docker build -t $DOCKER_REPO .

# Log in to Docker Hub
echo "$password" | docker login -u "$DOCKER_USR" --password-stdin

# Add image id
docker image tag $DOCKER_REPO:$DOCKER_TAG $DOCKER_USR/$DOCKER_REPO:$DOCKER_TAG

# Push the Docker image to Docker Hub
docker push $DOCKER_USR/$DOCKER_REPO