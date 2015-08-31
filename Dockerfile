FROM fedora:latest
MAINTAINER http://fedoraproject.org/wiki/Cloud

RUN dnf -y update && dnf clean all
RUN dnf -y install httpd && dnf clean all
RUN echo "Apache" >> /var/www/html/index.html

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart 
ADD run-apache.sh /run-apache.sh
RUN chmod -v +x /run-apache.sh

LABEL BZComponent testing
LABEL NAME testing
LABEL VERSION 0.0.1
LABEL RELEASE 1
LABEL ARCHITECTURE x86_64

CMD ["/run-apache.sh"]
