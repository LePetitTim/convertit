FROM ubuntu:bionic
MAINTAINER Makina Corpus "contact@geotrek.fr"

RUN apt-get update && upgrade -y -qq
RUN apt-get install -y -qq build-essential wget unoconv inkscape python-pip python-virtualenv
RUN apt-get autoclean && apt-get clean all

ADD . /opt/apps/convertit

WORKDIR /opt/apps/convertit

RUN virtualenv .
RUN ./bin/pip install Pillow django>=1.11,<2.0 gunicorn
RUN ./bin/python setup.py develop

EXPOSE 6543
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
