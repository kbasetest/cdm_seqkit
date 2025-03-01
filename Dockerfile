FROM ubuntu:24.04 as build

ENV VER=v2.9.0

WORKDIR /opt

RUN apt-get update && apt-get install -y wget

RUN wget https://github.com/shenwei356/seqkit/releases/download/$VER/seqkit_linux_amd64.tar.gz \
    && tar xzf seqkit_linux_amd64.tar.gz

FROM ubuntu:24.04

COPY --from=build /opt/seqkit /opt
    
ENTRYPOINT ["/opt/seqkit"]
