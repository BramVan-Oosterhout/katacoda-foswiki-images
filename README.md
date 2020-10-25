# katacoda-foswiki-images
The Docker files in this repository create images I use to support [Katacoda tutorial material](https://www.katacoda.com/bramvanoosterhout-tutorial) related to [Foswiki](https://foswiki.org). The images provide the minimal support for the tutorial. They load quickly, but they include  a very limited set of plugins and dependencies. 

If you are looking for a fully fledges Foswiki installation, you should use Tim Legge's [docker-foswiki](https://hub.docker.com/r/timlegge/docker-foswiki). That image comes with all plugins.

The images here are:

| `ubuntu-apache-foswiki` | An installation of Foswiki with an Apache web server under Ubuntu |
| `alpine-apache-foswiki` | An installation of Foswiki with an Apache web server under Alpine |

The `makefile` contains some commands I use often when maintaining these images. I find them useful. They are:
--------------------|---------------------------------
 `push` | push the developed Dockerfile and supporting material to github 
 `clone` | recreate the repository in another environment (Like Katacoda) 
 `certify` | create a user signed `ssl` certificate to support the `https` protocol on the web server 
 `build` | build the docker image 
 `run` | run the docker image. listens on port 80 
 `run-ssl` | run the docker image. Listens on port 443 
 `stop` | stop the docker image 
 `remove` | remove the docker image 

Whilst developing I use 
1. `make build`
2. `make run`
3. `make stop remove build run`

And other combinations.

Feel free to comment if you believe you can improve on what is here.



