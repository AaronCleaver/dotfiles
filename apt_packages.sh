#!/bin/bash 

set -e -x

sed -i -e "s@http://archive.ubuntu.com/ubuntu/@http://mirror.aarnet.edu.au/pub/ubuntu/archive/@" /etc/apt/sources.list

apt-get update
apt-get upgrade -y

apt-get install -y build-essential clang bison flex libreadline-dev gawk tcl-dev libffi-dev git mercurial graphviz xdot pkg-config python python3 libftdi-dev gperf libboost-program-options-dev autoconf libgmp-dev cmake
apt-get install -y -qq g++ gcc libc6-dev libffi-dev libgmp-dev make xz-utils zlib1g-dev git gnupg libtinfo-dev
apt-get install -y global tree bc iverilog gtkwave colordiff dos2unix cmake clang cgdb vim ctags autoconf gperf
apt-get install -y build-essential fakeroot autotools-dev bison bsdmainutils debhelper dh-strip-nondeterminism file flex gettext gettext-base gperf groff-base intltool-debian libarchive-zip-perl libasprintf0v5 libbison-dev libbz2-dev libcroco3 libfile-stripnondeterminism-perl libfl-dev libglib2.0-0 libmagic1 libpipeline1 libreadline-dev libreadline6-dev libsigsegv2 libtimedate-perl libtinfo-dev libxml2 m4 man-db po-debconf zlib1g-dev
apt-get install -y cscope zip mosh python3 python3-pip python3-setuptools
apt-get install -y xpra xserver-xephyr xinit xauth xclip x11-xserver-utils x11-utils nxagent
apt-get install -y docker.io
service docker start
pip3 install wheel
pip3 install pynvim
curl -fsSL https://raw.githubusercontent.com/mviereck/x11docker/master/x11docker | bash -s -- --update
