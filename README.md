# docker-openwrt
Compile openwrt in docker

## Complie
1. Go to `base_image`
2. Clone the repo
3. Compile `docker-compose up`

## Run
1. Fetch the image

`docker run duchenpaul/docker-build-openwrt`


## Build openwrt image
1. Free up some RAM `sync; echo 3 > /proc/sys/vm/drop_caches`
2. Place `.config` in this folder
3. Build image `docker build -t docker-build-openwrt:custom .`
4. Start to compile openwrt image: `docker run docker-build-openwrt:custom > compile$(date '+%Y%m%d%H%M%S').log 2>&1`