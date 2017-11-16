#!/bin/bash

: ${CONSUL_TEMPLATE_VERSION:=0.19.3}

curl --silent -z ./consul-template.tar.gz -o ./consul-template.tar.gz "https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz"


: ${VERSION:=1.0.0}
: ${REPOS="844537130703.dkr.ecr.us-west-2.amazonaws.com/dev"}

STORE=service-discovery/haproxy
docker build -t local/$STORE:$VERSION .

for E in ${REPOS};
do
  docker tag local/$STORE:$VERSION ${E}/$STORE:$VERSION
done;

