FROM ubuntu:19.10

# update
RUN apt-get update && apt-get upgrade -y

# install apt
RUN apt-get install -y --no-install-recommends \
sudo \
nano \
mc \
unzip \
wget

ADD add/start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
CMD ["/bin/start.sh"]
