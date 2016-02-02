FROM gliderlabs/alpine
MAINTAINER Olivier Bilodeau obilodeau@gosecure.ca

RUN apk --update add git python py-twisted py-zope-interface py-pip \
	gcc python-dev libc-dev libffi-dev openssl-dev \
	&& rm -f /var/cache/apk/*
RUN pip install pyasn1 pyOpenSSL service_identity
RUN adduser -D -s /bin/sh cowrie cowrie
USER cowrie
#RUN git clone https://github.com/micheloosterhof/cowrie.git /home/cowrie/cowrie
RUN git clone -b telnet-wip-deploy-4 https://github.com/GoSecure/cowrie.git /home/cowrie/cowrie
COPY cowrie.cfg /home/cowrie/cowrie/
COPY userdb.txt /home/cowrie/cowrie/data/
COPY start-docker.sh /home/cowrie/cowrie/
USER root
RUN chmod 755 /home/cowrie/cowrie/start-docker.sh
USER cowrie
EXPOSE 2222
EXPOSE 2223
ENTRYPOINT ["/home/cowrie/cowrie/start-docker.sh"]
