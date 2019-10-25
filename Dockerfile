FROM ubuntu:19.10

RUN apt-get install -y ash mc

ADD add/start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
CMD ["/bin/start.sh"]
