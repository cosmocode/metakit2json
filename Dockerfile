FROM debian:buster-slim

COPY setup.sh /root/setup.sh
COPY metakit2json.py /bin/metakit2json.py
RUN /bin/bash /root/setup.sh

WORKDIR /mnt
ENTRYPOINT [ "/bin/metakit2json.py" ]
