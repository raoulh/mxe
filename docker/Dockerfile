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
    gcc \
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

RUN make dbus fontconfig freetds libmysqlclient openssl postgresql sqlite icu4c zstd -j4 JOBS=20
RUN make jpeg libwebp xz minizip jasper tiff assimp lcms libmng libxml2 libxslt -j4 JOBS=20

RUN make qtbase -j4 JOBS=20
RUN make qtimageformats -j4 JOBS=20
RUN make qtsvg -j4 JOBS=20
RUN make qtxmlpatterns -j4 JOBS=20
RUN make qtdeclarative -j4 JOBS=20
RUN make qtgamepad -j4 JOBS=20
RUN make qt3d -j4 JOBS=20
RUN make qtactiveqt -j4 JOBS=20
RUN make qtmultimedia -j4 JOBS=20
RUN make qtcharts -j4 JOBS=20
RUN make qtconnectivity -j4 JOBS=20
RUN make qtdatavis3d -j4 JOBS=20
RUN make qtgraphicaleffects -j4 JOBS=20
RUN make qtlocation -j4 JOBS=20
RUN make qtlottie -j4 JOBS=20
RUN make qtnetworkauth -j4 JOBS=20
RUN make qtpurchasing -j4 JOBS=20
RUN make qtquick3d -j4 JOBS=20
RUN make qtquickcontrols -j4 JOBS=20
RUN make qtquickcontrols2 -j4 JOBS=20
RUN make qtremoteobjects -j4 JOBS=20
RUN make qtscript -j4 JOBS=20
RUN make qtscxml -j4 JOBS=20
RUN make qtsensors -j4 JOBS=20
RUN make qtserialport -j4 JOBS=20
RUN make qtserialbus -j4 JOBS=20
RUN make qtspeech -j4 JOBS=20
RUN make qttools -j4 JOBS=20
RUN make qttranslations -j4 JOBS=20
RUN make qtvirtualkeyboard -j4 JOBS=20
RUN make qtwebsockets -j4 JOBS=20
RUN make qtwebchannel -j4 JOBS=20
RUN make qtwebview -j4 JOBS=20
RUN make qtwinextras -j4 JOBS=20

RUN make qt5 -j4 JOBS=20

RUN make qtwebkit -j4 JOBS=20

#Use multi-stage to not keep builds deps and file into the final image to reduce size
FROM ubuntu:20.04
COPY --from=intermediate_builder /mxe/usr /mxe/usr

#Install missing dev tools
RUN apt update && \
    apt install -y \
        make zip unzip wget xz-utils git bzip2 bash curl

