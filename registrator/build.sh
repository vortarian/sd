#!/bin/bash

: ${VERSION:=1.0.0}
: ${REPOS="844537130703.dkr.ecr.us-west-2.amazonaws.com/dev"}

STORE=service-discovery/registrator
docker build -t local/$STORE:$VERSION .

for E in ${REPOS};
do
  docker tag local/$STORE:$VERSION ${E}/$STORE:$VERSION
done;

