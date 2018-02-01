# Leanote v2.6
    Leanote Docker

---


# 使用方法：

## 方法一

    将数据和配置文件保存在镜像内部

###     启动MongoDB

```
docker run -d --name mongodb -p 27017:27017 -v /data/mongodb/db:/data/db -e AUTH=no mongo
```

### 启动Leanote

```
docker run --name leanote -p 9000:80 -e MONGO_URL_IP="127.0.0.1" -d xiaobailong/leanote
```

---

## 方法二
    
    将数据以及配置文件挂载到宿主机器,需要在app.conf文件中配置mongdb
    
### 启动MongoDB
    
```
docker run -d --name mongodb -p 27017:27017 -v /data/mongodb/db:/data/db -e AUTH=no mongo
```

### 启动Leanote
    
```
docker run --name leanote -p 9000:80 \
    -v /data/leanote/conf:/usr/local/leanote/conf \
    -v /data/leanote/mongodb_backup:/usr/local/leanote/mongodb_backup \
    -e MONGO_URL_IP="127.0.0.1" \
    -d xiaobailong/leanote
```
