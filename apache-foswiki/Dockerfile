# Filename: Dockerfile
FROM httpd:2.4

WORKDIR /tmp
RUN apt-get install -y wget 

WORKDIR /var/www

# Download and extract Foswiki
RUN wget -O Foswiki-2.1.6.tgz https://github.com/foswiki/distro/releases/download/FoswikiRelease02x01x06/Foswiki-2.1.6.tgz
RUN tar -zxvf Foswiki-2.1.6.tgz 
RUN mv Foswiki-2.1.6 foswiki