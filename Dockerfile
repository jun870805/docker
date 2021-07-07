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
