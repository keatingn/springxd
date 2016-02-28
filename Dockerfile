FROM nkeating/java-minimal

MAINTAINER Noel Keating

RUN apk --update add bash

ENV XD_BUILD release
ENV XD_VERSION 1.3.1.RELEASE

RUN /usr/sbin/adduser -s /sbin/nologin -D -H springxd springxd

RUN mkdir /opt && \
wget http://repo.spring.io/${XD_BUILD}/org/springframework/xd/spring-xd/${XD_VERSION}/spring-xd-${XD_VERSION}-dist.zip \
      -O /opt/spring-xd-${XD_VERSION}-dist.zip \
    && unzip /opt/spring-xd-${XD_VERSION}-dist.zip -d /opt/ \
    && rm /opt/spring-xd-${XD_VERSION}-dist.zip \
    && chown -R springxd:springxd /opt/spring-xd-${XD_VERSION} \
    && ln -s /opt/spring-xd-${XD_VERSION} /opt/spring-xd

USER springxd
WORKDIR /opt/spring-xd
