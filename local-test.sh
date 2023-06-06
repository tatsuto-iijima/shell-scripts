#!/bin/bash

# docker-compose build --no-cache
docker-compose up -d
docker-compose exec ubuntu-22.04 sh -c "cd /usr/local/src/my-shell-scripts && shellspec"
docker-compose exec redhat-ubi8 sh -c "cd /usr/local/src/my-shell-scripts && shellspec"
docker-compose down