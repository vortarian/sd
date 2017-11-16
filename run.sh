#!/bin/bash

docker-compose stop ; docker-compose rm -vf ; docker-compose up consul registrator haproxy userstore
