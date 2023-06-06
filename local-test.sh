#!/bin/bash

BUILD_NO_CACHE=''

while (( $# > 0 ))
do
  case $1 in
    -n | --no-cache)
      BUILD_NO_CACHE=true
      ;;
    -* | --*)
      echo "invalid option"
      exit 1
      ;;
  esac
  shift
done

if [ $BUILD_NO_CACHE ]; then
  docker-compose build --no-cache
fi
docker-compose up -d

echo -e '\namazonlinux2023: test start'
docker-compose exec amazonlinux2023 sh -c "cd /usr/local/src/my-shell-scripts && shellspec"
echo -e 'amazonlinux2023: test end\n'

echo -e '\nredhat-ubi8: test start'
docker-compose exec redhat-ubi8 sh -c "cd /usr/local/src/my-shell-scripts && shellspec"
echo -e 'redhat-ubi8: test end\n'

echo -e '\nredhat-ubi9: test start'
docker-compose exec redhat-ubi9 sh -c "cd /usr/local/src/my-shell-scripts && shellspec"
echo -e 'redhat-ubi9: test end\n'

echo -e '\nubuntu22.04: test start'
docker-compose exec ubuntu22.04 sh -c "cd /usr/local/src/my-shell-scripts && shellspec"
echo -e 'ubuntu22.04: test end\n'

docker-compose down