FROM ubuntu:19.10

ADD add/start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
CMD ["/bin/start.sh"]
