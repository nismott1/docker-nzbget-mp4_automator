FROM linuxserver/sabnzbd

# Install Git
RUN apk add --no-cache git

# Install mkvtoolnix
RUN apk add --no-cache mkvtoolnix

# Install mediainfo
RUN apk add --no-cache mediainfo

# Install MP4 Automator
RUN apk add --no-cache \
  py-setuptools \
  py-pip \
  python-dev \
  libffi-dev \
  gcc \
  musl-dev \
  openssl-dev \
  ffmpeg
RUN pip install --upgrade PIP
RUN pip install requests
RUN pip install requests[security]
RUN pip install requests-cache
RUN pip install babelfish
RUN pip install "guessit<2"
RUN pip install "subliminal<2"
RUN pip install qtfaststart
RUN pip install python-dateutil

# As per https://github.com/mdhiggins/sickbeard_mp4_automator/issues/643
ONBUILD RUN pip uninstall stevedore
ONBUILD RUN pip install stevedore==1.19.1
