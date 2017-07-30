FROM centos:7

RUN mkdir /data
WORKDIR /usr/local

RUN yum install -y wget && yum install -y xorg-x11-fonts-75dpi && yum install -y xorg-x11-fonts-Type1
RUN wget https://bitbucket.org/wkhtmltopdf/wkhtmltopdf/downloads/wkhtmltox-0.13.0-alpha-7b36694_linux-centos7-amd64.rpm && \
    rpm -Uvh wkhtmltox-0.13.0-alpha-7b36694_linux-centos7-amd64.rpm && rm -rf wkhtmltox-0.13.0-alpha-7b36694_linux-centos7-amd64.rpm
RUN wget https://jaist.dl.sourceforge.net/project/leanote-bin/2.5/leanote-linux-amd64-v2.5.bin.tar.gz && \
    tar -xzvf leanote-linux-amd64-v2.5.bin.tar.gz && rm -rf leanote-linux-amd64-v2.5.bin.tar.gz && \
    wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.0.1.tgz && \
    tar -xzvf mongodb-linux-x86_64-3.0.1.tgz && rm -rf mongodb-linux-x86_64-3.0.1.tgz
RUN echo "export PATH=$PATH:/usr/local/mongodb-linux-x86_64-3.0.1/bin" >> /etc/profile
RUN mkdir -p /data/mongodb/conf && mkdir -p /data/mongodb/data
COPY mongodb.conf /data/mongodb/conf/mongodb.conf
RUN source /etc/profile && mongod -f /data/mongodb/conf/mongodb.conf && mongorestore -h localhost -d leanote --dir /usr/local/leanote/mongodb_backup/leanote_install_data/
COPY app.conf /usr/local/leanote/conf/app.conf

CMD source /etc/profile && mongod -f /data/mongodb/conf/mongodb.conf && bash /usr/local/leanote/bin/run.sh
