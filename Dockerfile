FROM linuxserver/nzbget
MAINTAINER Migz93

# Install MP4 Automator - Based on arontx/docker-sonarr-mp4-automator
RUN \
  apt-get update && \
  apt-get install -y \
  ffmpeg \
  git \
  python-pip \
  openssl \
  python-dev \
  libffi-dev \
  libssl-dev \
  libxml2-dev \
  libxslt1-dev \
  zlib1g-dev
  
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
  pip install qtfaststart
  
#Create volume for SMA, manually map below volume to physical volume on host with SMA files.
VOLUME /sickbeard_mp4_automator
