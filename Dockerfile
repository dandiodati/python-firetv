FROM python:3
MAINTAINER Jon Bullen

RUN apt-get update && apt-get install -y \
        libssl-dev \
        libusb-1.0-0 \
        python-dev \
	vim \
        swig \
        curl \
        unzip \
        && curl -L -o /tmp/master.zip https://github.com/happyleavesaoc/python-firetv/archive/master.zip \
        && cd /tmp \
        && unzip master.zip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip --no-cache-dir install --upgrade pip
RUN pip --no-cache-dir install flask adb_shell M2Crypto
RUN pip install /tmp/python-firetv-master[firetv-server]
COPY startFiretv.sh /usr/local/bin

CMD ["sh", "/usr/local/bin/startFiretv.sh"]

# docker build -t docker-firetv .
# docker run -it --rm --name docker-firetv -p 5556:5556 docker-firetv
