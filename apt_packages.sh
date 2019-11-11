#!/bin/bash 

set -e -x

apt update
apt upgrade -y

apt install -y build-essential clang bison flex libreadline-dev gawk tcl-dev libffi-dev git mercurial graphviz xdot pkg-config python python3 libftdi-dev gperf libboost-program-options-dev autoconf libgmp-dev cmake
apt install -y -qq g++ gcc libc6-dev libffi-dev libgmp-dev make xz-utils zlib1g-dev git gnupg libtinfo-dev
apt install -y global tree bc iverilog gtkwave colordiff dos2unix cmake clang cgdb vim ctags autoconf gperf
apt install -y build-essential fakeroot autotools-dev bison bsdmainutils debhelper dh-strip-nondeterminism file flex gettext gettext-base gperf groff-base intltool-debian libarchive-zip-perl libasprintf0v5 libbison-dev libbz2-dev libcroco3 libfile-stripnondeterminism-perl libfl-dev libglib2.0-0 libmagic1 libpipeline1 libreadline-dev libreadline6-dev libsigsegv2 libtimedate-perl libtinfo-dev libxml2 m4 man-db po-debconf zlib1g-dev
apt install -y cscope zip
apt install -y docker.io
service docker start
apt install -y python3 python3-pip python3-setuptools
pip3 install wheel
pip3 install pynvim
