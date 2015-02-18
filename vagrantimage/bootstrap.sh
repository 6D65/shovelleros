#!/usr/bin/env bash

sudo apt-get update

# install the fing add-apt-repository command
sudo apt-get install -y python-software-properties
sudo apt-get install -y software-properties-common
sudo apt-get install -y make
sudo apt-get install -y ant
sudo apt-get install build-essential -y

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

# Installing the NDK/SDK 9
# strangely enough the 9th NDK downloads faster the the 10th
# =======================================================

wget http://dl.google.com/android/ndk/android-ndk-r9d-linux-x86.tar.bz2
tar xvfj android-ndk-r9d-linux-x86.tar.bz2
echo 'export NDK_ROOT=/home/vagrant/android-ndk-r9d' >> ~/.bashrc


wget http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz
tar zxvf android-sdk_r24.0.2-linux.tgz
echo 'export ANDROID_SDK_ROOT=/home/vagrant/android-sdk-linux' >> ~/.bashrc


		# Installing the ndk10 which is not compatible with the current cocos2djs
		# wget http://dl.google.com/android/ndk/android-ndk-r10d-linux-x86.bin
		# sudo chmod a+x android-ndk-r10d-linux-x86.bin
		# sudo ./android-ndk-r10d-linux-x86.bin


		# wget http://www.cocos2d-x.org/filedown/cocos2d-x-3.4.zip
		# wget https://github.com/cocos2d/cocos2d-x/archive/cocos2d-x-3.4.zip
		# wget http://www.cocos2d-x.org/filedown/cocos2d-js-v3.3.zip

		# quite possibly that only this thingie is needed to make it work

wget https://github.com/cocos2d/cocos2d-js/archive/Cocos2d-JS-v3.3-final.zip

unzip Cocos2d-JS-v3.3-final.zip
mv cocos2d-js-Cocos2d-JS-v3.3-final/ cocosjs-3.3

cd cocosjs-3.3
sudo ./setup.py



# unzip cocos2d-js-v3.3.zip
# unzip cocos2d-x-3.4.zip

# sudo bash cocos2d-x-3.4/build/install-deps-linux.sh