# dockerfile to build eclipse


## Feature：automatically build java development environment in ubuntu desktop

## What is needed?
### 1. jdk-8u101-linux-x64.tar.gz
### 2. eclipse-jee-neon-1a-linux-gtk-x86_64.tar.gz
### Also, you can use other source package to replace them, just need to change the name in the dockerfile

## Install steps in the dockerfile：
### First, add 163 source list
### Second, install the ubuntu desktop
### Third, install the JDK-1.8.0
### Fourth, install the eclipse-neon
### Fifth, set the environment variable
### Sixth(opitional), create a develop user
