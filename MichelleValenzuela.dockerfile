FROM ubuntu

LABEL Michelle Valenzuela <Michelmiyat98@gmail.com>

WORKDIR /root

RUN apt-get -y update && \
	apt-get install -yq nano curl unzip less pip tldr &&\
	lang=c.UTF-8 &&\
    pip install csvkit


COPY Script.sh  /

ENTRYPOINT ["/Script.sh"]

