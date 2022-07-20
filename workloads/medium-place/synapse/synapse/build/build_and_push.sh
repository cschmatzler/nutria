#!/bin/sh
docker build --platform linux/amd64 -t cschmatzler/synapse:$1 .
docker push cschmatzler/synapse:$1