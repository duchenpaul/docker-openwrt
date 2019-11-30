FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive
# Base image: ubuntu
RUN sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && 
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && 
RUN apt-get update && 
RUN apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler && 
RUN apt-get -y autoremove --purge && 
RUN apt-get clean && 
RUN echo 'build-openwrt ENV READY'

# Base image: duchenpaul/build-openwrt:0.1
# Clone repo
RUN git clone -b https://github.com/openwrt/openwrt.git && 
RUN cd openwrt && 
RUN ./scripts/feeds update -a && ./scripts/feeds install -a && make defconfig