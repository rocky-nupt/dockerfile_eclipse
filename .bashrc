#!/bin/bash

export JAVA_HOME=/jdk
export CLASSPATH=${JAVA_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH

#ln -s /usr/lib/jni/libswt-*  /root/.swt/lib/linux/x86_64/
#export DISPLAY=192.168.153.140:0.0
/eclipse/eclipse/eclipse
