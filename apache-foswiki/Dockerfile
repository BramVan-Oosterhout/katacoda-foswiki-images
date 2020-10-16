# Filename: Dockerfile
FROM httpd:2.4

ENV PERL_MM_USE_DEFAULT 1

WORKDIR /tmp
RUN apt-get update
RUN apt-get install -y wget

RUN cpan -T install CGI CGI::Session Crypt::PasswdMD5 Error File::Copy::Recursive JSON

WORKDIR /var/www

# Download and extract Foswiki
RUN wget -O Foswiki-2.1.6.tgz https://github.com/foswiki/distro/releases/download/FoswikiRelease02x01x06/Foswiki-2.1.6.tgz
RUN tar -zxvf Foswiki-2.1.6.tgz 
RUN mv Foswiki-2.1.6 foswiki
RUN rm Foswiki-2.1.6.tgz
COPY foswiki.conf /usr/local/apache2/conf/extra/.
RUN sed -i '/# Supplemental configuration/a Include conf/extra/foswiki.conf' /usr/local/apache2/conf/httpd.conf