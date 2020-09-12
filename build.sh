#!/bin/bash -x

docker build -t stephaneeybert/streamsets:latest --rm=true .
if [ $? -eq 0 ]; then
docker tag stephaneeybert/streamsets:latest localhost:5000/streamsets:latest
docker push localhost:5000/streamsets:latest
docker tag stephaneeybert/streamsets:latest thalasoft.com:5000/streamsets:latest
#docker push thalasoft.com:5000/streamsets:latest
fi
