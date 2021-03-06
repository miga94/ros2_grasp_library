#!/bin/bash

DEPS_DIR=${DEPS_PATH}
SUDO=$1
if [ "$SUDO" == "sudo" ];then
        SUDO="sudo"
else
        SUDO=""
fi

# install gpd
cd $DEPS_DIR
git clone --depth 1 https://github.com/sharronliu/gpd.git -b libgpd
cd gpd/src/gpd
mkdir -p build && cd build
cmake -DUSE_OPENVINO=ON .. && make
$SUDO make install
