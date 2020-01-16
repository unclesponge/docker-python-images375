FROM ubuntu:18.04
ENV TZ=Asia/Shanghai
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt-get update \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone \
    && apt-get install -y python3.7 cron vim tzdata curl python3-distutils\
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.7 get-pip.py \
    && ln -s /usr/bin/python3.7 /usr/bin/python \
    && ln -s /usr/bin/pip3 /usr/bin/pip \
    && pip install --upgrade pip \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
CMD ["bash"]