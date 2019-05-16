FROM alpine:3.6
LABEL MAINTAINER="Yurii Fisakov <fisakov.root@gmail.com>"
RUN apk --no-cache add \
    sudo \
    python3 \
    openssl \
    ca-certificates \
    less \
    openssh-client \
    p7zip \
    py-lxml \
    rsync \
    sshpass \
    jq \
    curl


RUN apk --no-cache add --virtual \
    build-dependecies \
    python3-dev \
    libffi-dev \
    openssl-dev \
    build-base

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    rm -f get-pip.py

COPY requirements.txt /

RUN pip3 install --no-cache --upgrade -r /requirements.txt
WORKDIR /app
ENTRYPOINT [ "ansible" ]
CMD [ "--version" ]
