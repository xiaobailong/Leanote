FROM centos:7

RUN mkdir /data
WORKDIR /data

RUN yum install -y wget
RUN cd /usr/local && wget https://jaist.dl.sourceforge.net/project/leanote-bin/2.5/leanote-linux-amd64-v2.5.bin.tar.gz
RUN tar -xzvf leanote-linux-amd64-v2.5.bin.tar.gz && rm -rf leanote-linux-amd64-v2.5.bin.tar.gz
RUN wget https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-3.0.1.tgz && tar -xzvf mongodb-linux-x86_64-3.0.1.tgz && rm -rf mongodb-linux-x86_64-3.0.1.tgz
RUN echo "export PATH=$PATH:/usr/local/mongodb-linux-x86_64-3.0.1/bin" >> /etc/profile
RUN mkdir -p /data/mongodb
COPY mongodb.conf /data/mongodb/mongodb.conf
RUN mongorestore -h localhost -d leanote --dir /usr/local/leanote/mongodb_backup/leanote_install_data/

