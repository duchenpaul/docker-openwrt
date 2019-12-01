FROM duchenpaul/docker-build-openwrt
USER ubuntu
WORKDIR /home/ubuntu

ENV DEBIAN_FRONTEND=noninteractive


COPY .config openwrt
COPY custom.sh openwrt/custom.sh

WORKDIR /home/ubuntu/openwrt
RUN bash ./custom.sh
RUN ./scripts/feeds update -a && ./scripts/feeds install -a


CMD make -j$(nproc) V=s 
