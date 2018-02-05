#
# Wordmove Dockerfile
#

# Pull base image.
FROM ubuntu:14.04

MAINTAINER Simon Bland <simon.bland@bluewin.ch>

RUN apt-get update
RUN apt-get install -y \
  openssh-server \
  curl \
  rsync \
  php5 \
  php5-mysql \
  mysql-client-5.5
RUN \gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s latest
RUN echo "source /etc/profile.d/rvm.sh" >> /etc/bash.bashrc
RUN /bin/bash -c "source /etc/profile.d/rvm.sh \
  && rvm install ruby --latest \
  && gem install wordmove"
ENV RUBYOPT="-KU -E utf-8:utf-8"
RUN curl -o /usr/local/bin/wp -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp

# WP-CLI requires to be executed as non-root, unless --allow-root is given
# As Wordmove currently doesn't call WP-CLI with this flag, the image is executed with a non-root user
RUN useradd wordmove && echo "wordmove:wordmove" | chpasswd && adduser wordmove sudo
RUN mkdir -p /home/wordmove && chown wordmove:wordmove /home/wordmove
USER wordmove
RUN echo "alias sudo='sudo env PATH=\$PATH'" > /home/wordmove/.bashrc \
    && chown wordmove:wordmove /home/wordmove/.bashrc

WORKDIR /home/wordmove
CMD ["/bin/bash"]
