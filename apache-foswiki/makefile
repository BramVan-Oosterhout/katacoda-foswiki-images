# makefile for katacoda docker

push:
	git add *
	git commit -a -m 'Update'
	git push origin main

clone:
	git clone https://github.com/BramVan-Oosterhout/katacoda-foswiki-images

build:
	docker build -t apache2 .
run:
	docker run -d --name bvo -p 80:80 apache2
bash:
	docker exec -it bvo /bin/bash
stop: 
	docker stop bvo
remove: stop
	docker rm bvo