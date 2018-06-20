# This file is part of MXE. See LICENSE.md for licensing information.

PKG             := qttranslations
$(PKG)_WEBSITE  := https://www.qt.io/
$(PKG)_DESCR    := Qt
$(PKG)_IGNORE   :=
$(PKG)_VERSION   = $(qtbase_VERSION)
$(PKG)_CHECKSUM := 9822084f8e2d2939ba39f4af4c0c2320e45d5996762a9423f833055607604ed8
$(PKG)_SUBDIR    = $(subst qtbase,qttranslations,$(qtbase_SUBDIR))
$(PKG)_FILE      = $(subst qtbase,qttranslations,$(qtbase_FILE))
$(PKG)_URL       = $(subst qtbase,qttranslations,$(qtbase_URL))
$(PKG)_DEPS     := cc qtbase qttools

define $(PKG)_UPDATE
    echo $(qtbase_VERSION)
endef

define $(PKG)_BUILD
    cd '$(1)' && '$(PREFIX)/$(TARGET)/qt5/bin/qmake'
    $(MAKE) -C '$(1)' -j '$(JOBS)'
    $(MAKE) -C '$(1)' -j 1 install
endef

