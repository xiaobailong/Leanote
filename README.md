# Leanote
Leanote Docker


	
				docker run --name leanote -p 9000:9000 -d xiaobailong/Leanote
				/data/mongodb
	
				docker run --name leanote -p 9000:9000 \
				-v /data/mongodb/conf:/data/mongodb/conf \ 
				-v /data/mongodb/data:/data/mongodb/data \
				-v /data/leanote/conf:/usr/local/leanote/conf \
				-d xiaobailong/Leanote