# makefile for katacoda docker

push:
	git add *
	git commit -a -m 'Update'
	git push origin main

clone:
	git clone https://github.com/BramVan-Oosterhout/katacoda-foswiki-images
	
certify:
	/usr/lib/anaconda3/bin/openssl \
		req -newkey rsa:4096 \
            -x509 \
            -sha256 \
            -days 3650 \
            -nodes \
            -out KcBvO.crt \
            -keyout KcBvO.key

build:
	docker build -t apache2 .
run:
	docker run -d --name bvo -p 80:80 apache2
run-ssl:
	docker run -d --name bvo -p 443:443 apache2 
bash:
	docker exec -it bvo /bin/bash
stop: 
	docker stop bvo
remove: stop
	docker rm bvo