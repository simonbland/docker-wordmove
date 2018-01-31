# Docker-Wordmove

## What's inside
* ubuntu 14.04 (smaller one?)
* openssh-server
* curl
* rsync
* wordmove
* mysql-client-5.5
* php5
* wp-cli
* ENV RUBYOPT="-KU -E utf-8:utf-8" (Fix for some mysql sync issues)

## How to use
For example, to access wordmove in separated shell use the follow command:
`docker run -ti --rm --volumes-from DATAVOLUME -v $(HOME)/.ssh/:/root/.ssh:ro simonbland/wordmove bash`
