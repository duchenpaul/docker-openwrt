FROM duchenpaul/docker-build-openwrt

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /openwrt

COPY .config /openwrt
COPY custom.sh /openwrt/custom.sh

RUN bash ./custom.sh
RUN ./scripts/feeds update -a && ./scripts/feeds install -a && make defconfig

RUN groupadd -r ubuntu && useradd -r -g ubuntu ubuntu
USER ubuntu
CMD make -j$(nproc) V=s 
