FROM androidsdk/android-31:latest

# ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
# ENV jenv local 11 

# RUN apt-get update


# 安装一些必要的库
RUN apt-get update
# basics 
RUN apt-get install -y openssl 
# install RVM, Ruby, and Bundler 
RUN \curl -L https://get.rvm.io | bash -s stable 
RUN /bin/bash -l -c "rvm requirements" 
RUN /bin/bash -l -c "rvm install 2.6.0" 
RUN /bin/bash -l -c "gem install bundler -v 2.3.26" 

# RUN apt-get install -y build-essential ruby-full
# RUN gem install bundler -v 2.3.26
#RUN gem install fastlane

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn