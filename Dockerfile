FROM linuxserver/nzbget
MAINTAINER Migz93

VOLUME /scripts
VOLUME /sickbeard_mp4_automator

# Install Git
RUN apk add --no-cache git

# Install MP4 Automator
RUN git clone https://github.com/mdhiggins/sickbeard_mp4_automator.git /scripts/MP4_Automator
RUN apk add --no-cache \
  py-setuptools \
  py-pip \
  python-dev \
  libffi-dev \
  gcc \
  musl-dev \
  openssl-dev \
  ffmpeg

RUN \
  pip install --upgrade pip && \
  hash -r pip && \
  pip install requests && \
  pip install requests[security] && \
  pip install requests-cache && \
  pip install babelfish && \
  pip install 'guessit<2' && \
  pip install 'subliminal<2' && \
  pip install stevedore==1.19.1 && \
  pip install python-dateutil && \
  pip install qtfaststart && \
  touch /sickbeard_mp4_automator/info.log && \
  chmod a+rwx -R /sickbeard_mp4_automator && \
  ln -s /downloads /data && \
  ln -s /sickbeard_mp4_automator/autoProcess.ini /sickbeard_mp4_automator/autoProcess.ini

#Set MP4_Automator script settings in NZBGet settings
RUN echo 'NZBGetPostProcess.py:MP4_FOLDER=/scripts/MP4_Automator' >> /config/nzbget.conf
RUN echo 'NZBGetPostProcess.py:SHOULDCONVERT=True' >> /config/nzbget.conf

#Set script file permissions
RUN chmod 775 -R /scripts
