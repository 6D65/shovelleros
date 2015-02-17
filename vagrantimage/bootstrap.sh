#!/usr/bin/env bash

sudo apt-get update

# install the fing add-apt-repository command
sudo apt-get install -y python-software-properties
sudo apt-get install -y software-properties-common
sudo apt-get install -y make

# add the custom apt repository for java
# sudo add-apt-repository -y ppa:webupd8team/java

# sudo apt-get update

# # oracle and it's stupid license agreements
# echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
# echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# # self explainatory but still, install java
# sudo apt-get install -y oracle-java8-set-default


# stuff needed by the cocos2dx build
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install -y g++-4.9

sudo apt-get install -y git
sudo apt-get install -y cmake
sudo apt-get install -y libx11-dev
sudo apt-get install -y libxmu-dev
sudo apt-get install -y libglu1-mesa-dev
sudo apt-get install -y libgl2ps-dev
sudo apt-get install -y libxi-dev

sudo apt-get install -y libzip-dev
sudo apt-get install -y libpng12-dev
sudo apt-get install -y libcurl4-gnutls-dev
sudo apt-get install -y libfontconfig1-dev
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y libglew-dev
sudo apt-get install -y libssl-dev
sudo apt-get install -y libglfw-dev

sudo apt-get install unzip

wget http://www.cocos2d-x.org/filedown/cocos2d-x-3.4.zip
wget http://www.cocos2d-x.org/filedown/cocos2d-js-v3.3.zip

unzip cocos2d-js-v3.3.zip
unzip cocos2d-x-3.4.zip

cd cocos2d-x-3.4