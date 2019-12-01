FROM duchenpaul/docker-build-openwrt
RUN groupadd -r ubuntu && useradd -r -g ubuntu ubuntu
USER ubuntu
WORKDIR /home/ubuntu

ENV DEBIAN_FRONTEND=noninteractive


COPY .config openwrt
COPY custom.sh openwrt/custom.sh

WORKDIR /home/ubuntu/openwrt
RUN bash ./custom.sh
RUN ./scripts/feeds update -a && ./scripts/feeds install -a && make defconfig


CMD make -j$(nproc) V=s 
