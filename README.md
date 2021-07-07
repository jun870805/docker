Docker
==================


目錄
================

*   [Docker 基本介紹](#Step1)
*   [Docker 安裝](#Step2)
    *   [windows](#Step2-1)
    *   [MacOS](#Step2-2)
        *   [Homebrew安装](#Step2-2-1)
        *   [官網安装](#Step2-2-2)
    *   [Linux](#Step2-3)
        *   [CentOS](#Step2-3-1)
        *   [Ubuntu](#Step2-3-2)
*   [Docker 語法](#Step3)
    *   [映像檔 Image](#Step3-1)
    *   [容器 Container](#Step3-2)
    *   [倉庫 Repository](#Step3-3)
*   [案例：Web Server](#Step4)
    *   [案例架構](#Step4-1)
    *   [方法一、用base image一步步打包](#Step4-2)
    *   [方法二、用Dockerfile直接build](#Step4-3)
    *   [成果展示](#Step4-4)

<h1 id="Step1">Docker 基本介紹</h1>

<h3>映像檔（Image）</h3>

Docker 映像檔就是一個唯讀的模板。

映像檔可以用來建立 Docker 容器。

<h3>容器（Container）</h3>

容器是從映像檔建立的執行實例。

Docker 利用容器來執行應用。

可以被啟動、開始、停止、刪除。

每個容器都是相互隔離的、保證安全的平台。

<h3>倉庫（Repository）</h3>

倉庫是集中存放映像檔檔案的場所。

每個倉庫中又包含了多個映像檔。

每個映像檔有不同的標籤（tag）。

倉庫分為公開倉庫（Public）和私有倉庫（Private）兩種形式。

<h1 id="Step2">Docker 安裝</h1>

<h2 id="Step2-1">windows</h2>

**NOTE:** 需啟用 Hyper-V，可參考以下圖示

<img src="https://github.com/jun870805/docker/blob/1.0.1/Image/setting_windows.png" width="375">

**NOTE:** 電腦版本 Windows 10 以上，並已更新至2004版、組建18362或更高版本。

[按此][Step2-1]進入官網下載，並依照步驟完成

[Step2-1]:https://docs.docker.com/docker-for-windows/install/

<h2 id="Step2-2">MacOS</h2>

<h3 id="Step2-2-1">Homebrew安装</h3>

安裝 Homebrew

    #/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

更新 Homebrew

    #brew update

安裝 Docker

    #brew install docker

啟動Docker程序，依照指令執行完成即可完成安裝

    #open /Applications/Docker.app

<h3 id="Step2-2-2">官網安装</h3>

[按此][Step2-2-2]進入官網下載，選擇 Mac with Intel chip / Mac with Apple silicon

[Step2-2-2]:https://docs.docker.com/docker-for-mac/install/

1. 點擊兩下 .dmg 檔案，將圖標拖移至 Application 文件夾

<img src="https://github.com/jun870805/docker/blob/1.0.1/Image/dmg_macOS.png" width="375">

2. 在 Application 中找到Docker應用，並點擊執行

<img src="https://github.com/jun870805/docker/blob/1.0.1/Image/App_macOS.png" width="375">

3. 頂端狀態列會出現icon，點擊後會出現操作介面，可以看到 Docker is running

<img src="https://github.com/jun870805/docker/blob/1.0.1/Image/icon_macOS.png" width="375">

<img src="https://github.com/jun870805/docker/blob/1.0.1/Image/running_macOS.png" width="300">


<h2 id="Step2-3-1">CentOS</h2>

**NOTE:** 適用 CentOS 7 以上版本，詳細可[按此][Step2-3]參考。

[Step2-3]:https://docs.docker.com/engine/install/centos/

檢查 docker 有哪些版本

    #yum list docker-ce --showduplicates | sort -r

安裝 docker (指定安裝版本)

    #yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io

啟動 docker 的 service 

    #systemctl start docker

確認 docker 版本

    #docker version

設定自啟動 docker service

    #systemctl enable docker

查看安裝的 docker 有哪些東西

    #rpm -qa|grep docker

完全解除 docker 

    #yum remove docker-client
    #yum remove docker-common
    #cd /etc
    #rm –rf docker
    #cd /var/lib
    #rm –rf docker

<h2 id="Step2-3-2">Ubuntu</h2>

**NOTE:** 測試 Ubuntu 16.04.1 LTS 可用。

apt-get 安裝 docker

    #apt-get install docker.io

檢查 docker 是否有啟動

    #service docker status

檢查 docker 版本

    #docker version

<h1 id="Step3">Docker 語法</h1>

docker 說明

    #docker --help

<h2 id="Step3-1">映像檔 Image</h2>

搜尋 docker hub 上的 Image

    #docker search ImageName

下載 docker hub 上的 Image

    #docker pull ImageName[:TAG]

利用 Dockerfile 建立 Image 

    #cd YourDockerfilePath
    #docker build -t ImageName[:TAG] . 

顯示本機的 Image 列表 

    #docker images

刪除 Image

    #docker rmi ImageID

利用 Image 建立 Container 並啟動

    #docker run [OPTIONS] Image [ARG...] [COMMAND]

    常用參數：

    [OPTIONS]
    * -i : 讓 Container 的標準輸入保持打開
    * -t : 讓Docker分配一個虛擬終端（pseudo-tty）並綁定到 Container 的標準輸入上
    * -d : 讓 Container 處於背景執行狀態並印出 Container ID
    * -v : 將資料對映射到 Container 實體：虛擬
    * -p : 將 Container 發布到指定的port號 實體：虛擬
    * --name : 指定 Container 名稱
    * --privileged = true : 開啟特許權限

<h2 id="Step3-2">容器 Container</h2>

顯示本機的 Container 列表

    #docker ps -a

刪除 Container

    #docker rm ContainerID

啟動 Container

    #docker start ContainerID

重新啟動 Container

    #docker restart ContainerID

停止 Container

    #docker stop ContainerID

進入 Container

    #docker exec -it ContainerID /bin/bash
    //離開Container : #exit

顯示 Container 資訊

    #docker inspect ContainerID

顯示 Container log

    #docker logs -f ContainerID

<h2 id="Step3-3">倉庫 Repository</h2>

Container 存檔成 Image

    #docker commit ContainerID ImageName[:TAG]

將 Container 匯出 .tar 檔案到本地端

    #docker export ContainerID > FileName.tar

從本地端匯入 .tar 檔案到 Image

    #cat FileName.tar | sudo docker import - ContainerName[:TAG]

<h1 id="Step4">案例：Web Server</h1>

<h2 id="Step4-1">案例架構</h2>

<img src="https://github.com/jun870805/docker/blob/1.0.1/Image/Architecture.png" width="375">

<h2 id="Step4-2">方法一、用base image一步步打包</h2>

下載 CentOS:7

    #docker pull centos:7

執行 CentOS:7 的 Image

    #docker run -itd --name WebServer --privileged=true -p 800:8080  centos:7 /bin/bash

確認 Container WebServer

    #docker ps -a

進入 Container 

    #docker exec -it WebServer /bin/bash

安裝相關的開發工具 及 PCRE(讓 Nginx 支持 Rewrite 功能)

    #yum -y install make zlib zlib-devel gcc-c++ libtool  openssl openssl-devel wget coreutils
    #cd /
    #wget http://downloads.sourceforge.net/project/pcre/pcre/8.35/pcre-8.35.tar.gz
    #tar zxvf pcre-8.35.tar.gz
    #cd pcre-8.35
    #./configure
    #make && make install
    #pcre-config --version

安裝 Ngnix

    #cd /
    #wget http://nginx.org/download/nginx-1.18.0.tar.gz
    #tar zxvf nginx-1.18.0.tar.gz 
    #cd nginx-1.18.0
    #./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-pcre=/pcre-8.35
    #make && make install

設定 Ngnix conf

    #truncate -s 0 /usr/local/nginx/conf/nginx.conf
    #vi /usr/local/nginx/conf/nginx.conf

        # 對外 port
        listen       8080;
        # 對外 route
        location /api/ {}
        # 被轉址 api，放 gunicorn 設定的 port 和 route
        proxy_pass http://127.0.0.1:5000/api/;

檢查 Ngnix conf

    #/usr/local/nginx/sbin/nginx -t

直接啟動 Ngnix

    #/usr/local/nginx/sbin/nginx

    ＃ 重啟 Ngnix
    #/usr/local/nginx/sbin/nginx  -s reload

將 Ngnix 設置開機自啟

    #vi /etc/init.d/ngnix (參考 ngnix 檔案)
    #chkconfig --add /etc/init.d/nginx
    #chkconfig nginx on
    #systemctl start nginx.service
    #systemctl enable nginx.service
    #systemctl is-enabled nginx.service

安裝 Python 3.6 及 套件

    #yum -y install python36
    #pip3 install flask flask_socketio flask_cors gunicorn 

撰寫 Flask + gunicorn

    #cd /
    #mkdir webserver
    #vi app.py

        import os
        from flask import Flask, request, abort

        app = Flask(__name__)

        ＃ Flask GET/POST home 
        @app.route("/api/home", methods=['GET','POST'])
        def home():
            text = ""
            if request.method == 'GET':
                text = request.args.get('value')
            if request.method == 'POST':
                text = request.form.get('value')

            return "Hello "+str(text)+"~~~~~"

    #vi wsgi.py

        from app import app

    #vi config.py

        import os
        bind = "0.0.0.0:5000"
        workers = os.cpu_count() * 2 + 1

直接啟動 gunicorn

    #cd /webserver
    #gunicorn -c config.py wsgi:app --daemon

測試經過 gunicorn 後的 api

    #curl -X GET "http://127.0.0.1:5000/api/home"

測試經過 Ngnix 轉址後的 api

    #curl -X GET "http://127.0.0.1:8080/api/home"

增加 Ngnix 和 gunicorn 執行檔

    #cd /
    #vi start.sh

        cd /webserver
        /usr/local/nginx/sbin/nginx
        gunicorn -c config.py wsgi:app

匯出壓縮檔

    #docker export WebServer > WebServer_v1.0.1.tar

**NOTE:** 使用壓縮檔執行Container

    #cat WebServer_v1.0.1.tar | sudo docker import - webserver:1.0.1
    #docker run -itd --name WebServer -p 8000:8080 webserver:1.0.1 bash start.sh

<h2 id="Step4-3">方法二、用Dockerfile直接build</h2>

Dockerfile

    # 使用的 centos 7 映像檔版本
    FROM centos:7

    # 作者
    LABEL maintainer = "jun870805@gmail.com"

    # 安裝相關的開發工具
    RUN yum -y install make zlib zlib-devel gcc-c++ libtool  openssl openssl-devel wget coreutils

    # 安裝 PCRE
    WORKDIR /
    RUN wget http://downloads.sourceforge.net/project/pcre/pcre/8.35/pcre-8.35.tar.gz
    RUN tar zxvf pcre-8.35.tar.gz
    WORKDIR /pcre-8.35
    RUN ./configure
    RUN make && make install

    # 安裝 Ngnix
    WORKDIR /
    RUN wget http://nginx.org/download/nginx-1.18.0.tar.gz
    RUN tar zxvf nginx-1.18.0.tar.gz 
    WORKDIR /nginx-1.18.0
    RUN ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-pcre=/pcre-8.35
    RUN make && make install

    # 設定 Ngnix conf
    RUN rm -f /usr/local/nginx/conf/nginx.conf
    COPY /webserver/nginx.conf /usr/local/nginx/conf

    #檢查 Ngnix conf
    RUN /usr/local/nginx/sbin/nginx -t

    # 安裝 python 3.6
    RUN yum -y install python36
    RUN pip3 install flask flask_socketio flask_cors gunicorn

    # 放入 Flask + WSGI 檔案
    WORKDIR /
    RUN mkdir webserver
    COPY /webserver/app.py /webserver
    COPY /webserver/config.py /webserver
    COPY /webserver/wsgi.py /webserver

    # 建立 run 要執行的文件
    WORKDIR /
    COPY /webserver/start.sh /
    RUN chmod +x start.sh

    # 安裝 dos2unix (解決 sh 編碼問題)
    RUN yum install -y dos2unix
    RUN dos2unix start.sh

Build Dockerfile

    #docker build -t myserver . --no-cache

Build Container

    #docker run -itd --name WebServer -p 800:8080 myserver  bash start.sh

<h2 id="Step4-4">成果展示</h2>

<img src="https://github.com/jun870805/docker/blob/1.0.1/Image/result_home.png" width="300">

<img src="https://github.com/jun870805/docker/blob/1.0.1/Image/result_api.png" width="300">