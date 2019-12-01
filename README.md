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
1. Place `.config` in this folder
2. Build image `docker build -t docker-build-openwrt:custom .`