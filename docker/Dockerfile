FROM ubuntu:20.04 as intermediate_builder

LABEL maintainer="r.hecky@emc-partner.ch"
LABEL description="Ubuntu image with Qt5 build with mxe"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    lzip \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    python \
    ruby \
    sed \
    unzip \
    wget \
    xz-utils

WORKDIR /mxe

COPY mxe_mingw_qt5 /mxe

RUN make dbus fontconfig freetds libmysqlclient openssl postgresql sqlite icu4c zstd -j4 JOBS=32

RUN cd /mxe && \
    make qt5 -j4 JOBS=32

#Use multi-stage to not keep builds deps and file into the final image to reduce size
FROM ubuntu:20.04
COPY --from=intermediate_builder /mxe/usr /mxe/usr
