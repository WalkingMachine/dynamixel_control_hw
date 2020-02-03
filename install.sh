#!/usr/bin/env bash
##
## This script is intended to be automatically run by catkin when compiling.
##

repositoryName="libdynamixel"
installPath="~/libdynamixel"
defaultBranch="x-series"

if [ ! -d $repositoryName ]; then
    echo -e "\n*** Cloning libdynamixel ***"
    git clone --single-branch --branch $defaultBranch https://github.com/resibots/libdynamixel
else
    echo "*** libdynamixel is already cloned"
fi

echo -e "\n*** Installing libdynamixel ***"
cd $repositoryName &&\
git pull origin $defaultBranch
./waf configure --prefix $installPath &&\
./waf && ./waf install
