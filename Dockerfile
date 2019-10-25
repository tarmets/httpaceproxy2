FROM ubuntu:19.10

# time zone data
ENV TZ=Europe/Tallinn
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# update
RUN apt-get update && apt-get upgrade -y

# install apt
RUN apt-get install -y --no-install-recommends \
sudo \
nano \
mc \
unzip \
wget
python3-pip \
build-essential \
checkinstall \
libreadline-gplv2-dev \
libncursesw5-dev \
libssl-dev \
libsqlite3-dev \
tk-dev \
libgdbm-dev \
libc6-dev \
libbz2-dev \
libffi-dev \
zlib1g-dev

# clean up
RUN rm -rf Python-3.8.0.tgz

ADD add/start.sh /bin/start.sh
RUN chmod +x /bin/start.sh
CMD ["/bin/start.sh"]
