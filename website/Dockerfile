FROM python:3
MAINTAINER "Pietro Bertera" <pietro@bertera.it>

RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive && \
    apt-get update && apt-get -y upgrade && \
    apt-get install -y vim make git pandoc tex-common texlive && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /
RUN pip install -r /requirements.txt
#RUN pip install pelican Markdown ghp-import
#RUN pip install --upgrade pelican Markdown ghp-import
