#The Shovellers Game

## The Idea

## Getting started

The game is basend on the [Cocos2d-x game engine](http://www.cocos2d-x.org/), more specifically the JavaScript
version of it, which is called cocos2d-js. 


## The devbox images 

We started out with Vagrant images, but these are quite cumbersome, and mostly vagrant specific(though it's possible to reuse bits from the provisioning shell script.).
We would like to use Docker as a build machine, and that means porting the porvisioning script to Docker, which has a quite bad syntax.
Probably the best solution is to use [Packer from Hashicorp](https://packer.io/), which is a tool for specifying the requirements for a machine, and it would spit out Vagrant, Docker, VMWare, you name it, VMs.
It looks like the right tool for the job.


[Building Packer Docker Images](https://www.packer.io/docs/builders/docker.html)


This seems to be the answer:

[Getting started with cocos2d-html5](https://github.com/cocos2d/cocos2d-html5) and a working html5 dev environment seems to be a bowerinstall away.


```bash
vagrant up
```

The script by itself will install all the prerequisites for the cocos2d-x and cocos2d-js, including the android sdk/ndk.
**Note:** not done yet.

## Installing the cocos2d-x/js on Linux

http://www.cocos2d-x.org/wiki/Linux_Installation_and_Setup

## Adding GLEW cmake to make the build work
http://jasonjuang.blogspot.com/2013/10/adding-findglewcmake-to-cmake-in-ubuntu.html