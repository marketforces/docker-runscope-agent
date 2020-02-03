FROM frolvlad/alpine-glibc

RUN apk add --no-cache bash curl openssl tar gzip ca-certificates

ADD radar.conf.example /etc/runscope-radar/radar.conf
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

RUN wget http://s3.amazonaws.com/runscope-downloads/runscope-radar/latest/linux-amd64/runscope-radar.zip && \
    unzip runscope-radar.zip -d /usr/local/bin/

CMD ["/usr/local/bin/run.sh"]
