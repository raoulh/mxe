# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := libgit2
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 0.24.1
$(PKG)_CHECKSUM := 60198cbb34066b9b5c1613d15c0479f6cd25f4aef42f7ec515cd1cc13a77fede
$(PKG)_SUBDIR   := $(PKG)-$($(PKG)_VERSION)
$(PKG)_FILE     := $(PKG)-$($(PKG)_VERSION).tar.gz
$(PKG)_URL      := https://github.com/libgit2/libgit2/archive/v$($(PKG)_VERSION).tar.gz
$(PKG)_DEPS     := gcc libssh2

define $(PKG)_BUILD
    mkdir '$(1).build'
    cd '$(1).build' && cmake \
        -DCMAKE_TOOLCHAIN_FILE='$(CMAKE_TOOLCHAIN_FILE)' \
        -DDLLTOOL='$(PREFIX)/bin/$(TARGET)-dlltool' \
        -DBUILD_SHARED_LIBS=$(if $(BUILD_STATIC),OFF,ON) \
        '$(1)'
    $(MAKE) -C '$(1).build' -j '$(JOBS)' VERBOSE=1 || $(MAKE) -C '$(1).build' -j 1 VERBOSE=1
    $(MAKE) -C '$(1).build' -j 1 install VERBOSE=1
endef
