FROM duchenpaul/docker-build-openwrt
RUN groupadd -r ubuntu && useradd -r -g ubuntu ubuntu
USER ubuntu

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /openwrt

COPY .config /openwrt
COPY custom.sh /openwrt/custom.sh

RUN bash ./custom.sh
RUN ./scripts/feeds update -a && ./scripts/feeds install -a && make defconfig


CMD make -j$(nproc) V=s 
