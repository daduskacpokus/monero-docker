FROM ubuntu:latest
WORKDIR /usr/local/bin
RUN apt-get update -y -qq && apt upgrade -y -qq
RUN apt-get install -y -qq sudo curl git vim htop wget bzip2 screen
ENV moneroVersion=v0.11.1.0

RUN wget https://downloads.getmonero.org/cli/monero-linux-x64-${moneroVersion}.tar.bz2
RUN tar -xvjf monero-linux-x64-${moneroVersion}.tar.bz2 && rm -f monero-linux-x64-${moneroVersion}.tar.bz2
RUN cd monero-${moneroVersion} && mv * .. && cd .. && rm -rf monero-${moneroVersion}

VOLUME [ "/root/.bitmonero" ]
EXPOSE  18081

CMD ["screen -dmS monerod monerod --fast-block-sync 1"]