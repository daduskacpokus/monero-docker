#!/bin/bash
tag=latest
imageName=monero-docker
docker build -f Dockerfile -t rafalsladek/$imageName:$tag .
#docker push rafalsladek/$imageName:$tag

# run container with bash
#docker run -it --rm  -v $(PWD)/.bitmonero:/root/.bitmonero -p 18080:18080 -p 18081:18081 rafalsladek/$imageName /bin/bash

# run container forever
#docker run -d -v $(PWD)/.bitmonero:/root/.bitmonero -p 18080:18080 -p 18081:18081 --name monero-fullnode --restart unless-stopped  rafalsladek/$imageName:latest