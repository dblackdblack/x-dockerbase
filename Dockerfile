#FROM ubuntu:xenial
FROM postgres:9.6

ENV _PIP_VERSION=9.0.1 \
    LC_ALL=en_US.UTF-8 \
    LC_CTYPE=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    POSTGRES_VERSION=9.6 

RUN apt-get update \
  && apt-get -y upgrade \
  && apt-get -y install locales \
  && echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
  && locale-gen en_US.UTF-8 \
  && dpkg-reconfigure locales \
  && /usr/sbin/update-locale LANG=en_US.UTF-8 \
  && apt-get -y install \
      apt-transport-https \
      curl \
      wget \
      vim \
      emacs-nox \
      nano \
      ca-certificates \
      python3-dev \
      python3-setuptools \
      postgresql-${POSTGRES_VERSION} \
  && easy_install3 pip==$_PIP_VERSION \
  && install -d /app -o nobody -g nogroup -m 0755

RUN pip3 install flask \
    flask-sqlalchemy \
    gunicorn \
    psycopg2 \
    ipython \
    names 
