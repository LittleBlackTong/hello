#! /bin/bash

function AutomaticDepoly(){
    # 1. 杀死已经运行的线程
    ps -ef | grep hello-0.0.1-SNAPSHOT.jar | grep -v "grep" | cut -c 7-15 |xargs kill -9;
    # 2. git 拉取新的代码
    git pull;
    # 3. maven 打包新的程序
    mvn clean install -B ;
    # 4. 进入到 target 目录运行程序
    cd target/;
    java -jar hello-0.0.1-SNAPSHOT.jar &
}


AutomaticDepoly;
