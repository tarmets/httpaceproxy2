FROM ubuntu:19.10

# time zone data
ENV TZ=Europe/Tallinn
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# port
EXPOSE 8585 6878 8621 62062

# update
RUN apt-get update && apt-get upgrade -y

# install apt
RUN apt-get install -y \
python-setuptools \
python-m2crypto \
python-libxslt1 \
python-apsw \
unzip \
cron \
sudo \
nano \
wget \
htop \
mc \
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
RUN wget --no-check-certificate https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz && \
tar xzf Python-3.8.0.tgz && \
mv Python-3.8.0 /opt/
RUN cd /opt/Python-3.8.0 && \
./configure --enable-optimizations && \
make altinstall
RUN pip3.8 install --upgrade pip && \
pip3.8 install --upgrade gevent && \
pip3.8 install --upgrade psutil

# mnt/films
RUN mkdir -p /mnt/films

# install aceproxy
RUN wget --no-check-certificate https://github.com/pepsik-kiev/HTTPAceProxy/archive/master.zip && \
unzip master.zip -d /opt/

# install acestream
RUN wget --no-check-certificate https://github.com/tarmets/test/blob/master/acestream_3.1.49_ubuntu_18.04_x86_64.zip?raw=true && \
unzip acestream_3.1.49_ubuntu_18.04_x86_64.zip?raw=true -d /opt/

# cron-comand
RUN (crontab -l ; echo "00 0-23/12 * * * apt-get update && apt-get upgrade -y && apt autoremove -y") | crontab

# clean
RUN rm -rf acestream_3.1.49_ubuntu_18.04_x86_64.zip?raw=true master.zip Python-3.8.0.tgz && \
apt autoremove -y
RUN rm -r /opt/Python-3.8.0

# add files
ADD add/start.sh /bin/start.sh
ADD add/torrenttv.py /opt/HTTPAceProxy-master/plugins/config/torrenttv.py
ADD add/aceconfig.py /opt/HTTPAceProxy-master/aceconfig.py
RUN chmod +x /opt/acestream.engine/acestreamengine
RUN chmod +x /opt/acestream.engine/start-engine
RUN chmod +x /bin/start.sh
CMD ["/bin/start.sh"]
