# This file is part of MXE.
# See index.html for further information.

PKG             := libssh
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.7.3
$(PKG)_CHECKSUM := 26ef46be555da21112c01e4b9f5e3abba9194485c8822ab55ba3d6496222af98
$(PKG)_SUBDIR   := libssh-$($(PKG)_VERSION)
$(PKG)_FILE     := libssh-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := https://red.libssh.org/attachments/download/195/$($(PKG)_FILE)
$(PKG)_DEPS     := cc zlib openssl

define $(PKG)_BUILD
    mkdir '$(1)/build'
    cd '$(1)/build' && cmake ../ \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DWITH_GCRYPT=OFF \
        -DWITH_STATIC_LIB=$(if $(BUILD_SHARED),OFF,ON) 
    $(MAKE) -C '$(1)/build' -j 1 install
endef
