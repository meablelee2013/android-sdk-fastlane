FROM androidsdk/android-31:latest

# ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
# ENV jenv local 11 

# RUN apt-get update


# RUN apt-get update

# RUN apt-get install -y build-essential ruby-full

RUN apt-get update -y && apt-get install -y \
  build-essential \
  zlib1g-dev \
  libssl-dev \
  libreadline-dev \
  libyaml-dev \
  libxml2-dev \
  libxslt1-dev \
  libffi-dev \
  libpq-dev
RUN curl -L -O https://cache.ruby-lang.org/pub/ruby/3.0/ruby-3.0.0.tar.gz && \
  tar -xzvf ruby-3.0.0.tar.gz
WORKDIR ruby-3.0.0
RUN ./configure && make && make install
RUN ruby --version
RUN rm -rf ruby-3.0.0.tar.gz ruby-3.0.0


RUN gem update --system 3.2.3
RUN gem install bundler -v 2.4.3

RUN gem install fastlane -v 2.212.1

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn