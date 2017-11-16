#!/bin/bash

 set -e

 : ${REPOS="844537130703.dkr.ecr.us-west-2.amazonaws.com/dev"}
 : ${VERSION:=2.0.1}
 
 export SHELLOPTS
 export REPOS
 export VERSION

 set $SHELLOPTS
 echo opts: $SHELLOPTS

 : ${IMAGE_NAMES:= service-discovery/haproxy service-discovery/registrator }

echo REPOS=${REPOS}
echo IMAGE_NAMES=${IMAGE_NAMES}

for I in ${IMAGE_NAMES}; do
  for R in ${REPOS}; do
    docker push $R/$I:$VERSION &
  done
  wait
done;
