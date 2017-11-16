#!/bin/bash
set -e

# park-idm
REPOS="844537130703.dkr.ecr.us-east-2.amazonaws.com/prod"
REPOS="${REPOS} 844537130703.dkr.ecr.us-east-2.amazonaws.com/stage"
REPOS="${REPOS} 844537130703.dkr.ecr.us-east-2.amazonaws.com/acc"

# idm-envs
REPOS="${REPOS} 844537130703.dkr.ecr.us-west-2.amazonaws.com/dev"

export REPOS

echo Running build for $REPOS
./build.sh 
./push.sh

