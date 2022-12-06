FROM ubuntu:20.04

ARG DEB_NAME
RUN apt-get -y update

# Local Copy Example (assumes deb package in CWD)
COPY $DEB_NAME fastDAST.deb
RUN DEBIAN_FRONTEND=noninteractive apt install -y -f ./fastDAST.deb
RUN rm fastDAST.deb

RUN fast-dast-api --init

ENV FASTDAST_LICENSE_KEY=""
EXPOSE 27374
ENTRYPOINT [ "/usr/local/bin/fast-dast-api" ]