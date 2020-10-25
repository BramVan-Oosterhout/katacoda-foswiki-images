# Filename: Dockerfile
FROM httpd:2.4

ENV PERL_MM_USE_DEFAULT 1

WORKDIR /tmp
RUN apt-get update
RUN apt-get install -y wget libarray-utils-perl make build-essential

RUN cpan -T install CGI CGI::Session Crypt::PasswdMD5 Error File::Copy::Recursive JSON HTML::TreeBuilder

WORKDIR /var/www

# Download and extract Foswiki
RUN wget -O Foswiki-2.1.6.tgz https://github.com/foswiki/distro/releases/download/FoswikiRelease02x01x06/Foswiki-2.1.6.tgz
RUN tar -zxvf Foswiki-2.1.6.tgz 
RUN mv Foswiki-2.1.6 foswiki
RUN rm Foswiki-2.1.6.tgz

WORKDIR /var/www/foswiki

#configure Foswiki
RUN tools/configure -save -noprompt
#RUN tools/configure -save -set {DefaultUrlHost}='http://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com'
RUN tools/configure -save -set {Password}='password'
RUN tools/configure -save -set {Sessions}{UseIPMatching}='0'
RUN touch data/.htpasswd
RUN chown -R daemon:daemon *

# Configure the httpd server
COPY foswiki.conf /usr/local/apache2/conf/extra/.
COPY KcBvO.crt /usr/local/apache2/conf/server.crt
COPY KcBvO.key /usr/local/apache2/conf/server.key
RUN sed -i -e 's/^#\(Include .*httpd-ssl.conf\)/\1/' -e 's/^#\(LoadModule .*mod_ssl.so\)/\1/' -e 's/^#\(LoadModule .*mod_socache_shmcb.so\)/\1/' /usr/local/apache2/conf/httpd.conf
RUN sed -i '/# Supplemental configuration/a Include conf/extra/foswiki.conf' /usr/local/apache2/conf/httpd.conf
RUN mkdir /var/log/httpd
RUN sed -ri -e 's!^(\s*CustomLog)\s+\S+!\1 /var/log/httpd/access.log!g' -e 's!^(\s*ErrorLog)\s+\S+!\1 /var/log/httpd/error.log!g' "/usr/local/apache2/conf/httpd.conf" 
