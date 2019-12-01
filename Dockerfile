FROM duchenpaul/docker-build-openwrt

ENV DEBIAN_FRONTEND=noninteractive

COPY .config /openwrt
COPY custom.sh /openwrt/custom.sh

RUN cd openwrt && bash ./custom.sh
RUN cd openwrt && ./scripts/feeds update -a && ./scripts/feeds install -a && make defconfig

WORKDIR openwrt
CMD ["make -j$(nproc) V=s"]
