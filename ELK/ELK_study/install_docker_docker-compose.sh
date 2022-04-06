#!/bin/bash

# Docker 설치
# https://docs.docker.com/engine/install/centos/ 사이트 자료를 참고하여 설치한다.
yum -y update
yum install -y yum-utils

# Docker repository 시스템에 추가
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum-config-manager --enable docker-ce-nightly

# 최신버전의 Docker 설치(Install Docker Engine)
yum -y install docker-ce docker-ce-cli containerd.io

# Docker 데몬 시작 및 부팅 시 Docker 데몬 자동 시작
systemctl start docker
systemctl enable docker

# Docker 실행중인지 확인
systemctl status docker

# docker-compose 설치
sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# docker-compose 실행 권한 부여
sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version
~                                                                                                                                                               
~                                   
