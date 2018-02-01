#/bin/bash

mongorestore -h $MONGO_URL_IP -d leanote --dir /usr/local/leanote/mongodb_backup/leanote_install_data/