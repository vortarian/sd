#!/bin/bash -x

set -e
 
: ${REPOS="844537130703.dkr.ecr.us-west-2.amazonaws.com/dev"}
: ${VERSION:=1.0.0}
 
export SHELLOPTS
export REPOS
export VERSION

set $SHELLOPTS echo opts: $SHELLOPTS

: ${IMAGE_DIRECTORIES:="haproxy registrator "}

echo REPOS=${REPOS}
echo IMAGE_DIRECTORIES=$IMAGE_DIRECTORIES
for i in $IMAGE_DIRECTORIES; do
  pushd $i
  ./build.sh
  popd
done;
