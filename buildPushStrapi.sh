#! /bin/sh
if [ -f .env ]; then
  export $(echo $(cat .env | sed 's/#.*//g'| xargs) | envsubst)
fi

docker buildx build --platform linux/amd64,linux/arm64 -t "jameswrc/docker-backup-to-s3" --push .
