FROM rhel:6

MAINTAINER "Dzung Do" <ddo@redhat.com>


ENV UID 1001
ENV USER apache
ENV GROUP apache

RUN groupadd $GROUP
RUN useradd -u $UID -g $GROUP -m -s /bin/bash $USER

RUN yum -y install httpd mod_ssl openssl
RUN yum clean all
RUN chown -R $UID:$UID /var/www

EXPOSE 80

ADD index.html /var/www/html/
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
