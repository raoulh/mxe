# This is a template of configuration file for MXE. See
# index.html for more extensive documentations.

# This variable controls the number of compilation processes
# within one package ("intra-package parallelism").
JOBS := 12

# This variable controls where intermediate files are created
# this is necessary when compiling inside a virtualbox shared
# directory. Some commands like strip fail in there with Protocol error
# default is the current directory
#MXE_TMP := /tmp

# This variable controls the targets that will build.
#MXE_TARGETS :=  i686-w64-mingw32.static i686-w64-mingw32.shared  x86_64-w64-mingw32.static x86_64-w64-mingw32.shared
MXE_TARGETS := i686-w64-mingw32.shared.posix x86_64-w64-mingw32.shared.posix

# This variable controls the download mirror for SourceForge,
# when it is used. Enabling the value below means auto.
#SOURCEFORGE_MIRROR := downloads.sourceforge.net

# The three lines below makes `make` build these "local
# packages" instead of all packages.
#LOCAL_PKG_LIST := boost curl file flac lzo pthreads vorbis wxwidgets
#.DEFAULT local-pkg-list:
#local-pkg-list: $(LOCAL_PKG_LIST)

#enable mingw secure API
mingw-w64-headers_CONFIGURE_OPTS := --enable-secure-api
