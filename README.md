Docker image to run [Wordmove](https://welaika.github.io/wordmove/).

Based on [mfuezesi/docker-wordmove](
https://github.com/mfuezesi/docker-wordmove), with WP-CLI support added. 

## What's inside

* ubuntu 14.04
* openssh-server
* curl
* rsync
* wordmove
* mysql-client-5.5
* php5
* wp-cli
* ENV RUBYOPT="-KU -E utf-8:utf-8" (Fix for some mysql sync issues)

## How to use

### To run this image

`docker run -it --rm -v ~/.ssh:/home/wordmove/.ssh:ro simonbland/wordmove bash`

This starts a shell, with `wordmove` available on the command-line.

### To run this image in a full Docker-based WordPress environment

See [Wordpress development made easy using Docker](
https://medium.com/cluetip/wordpress-development-made-easy-440b564185f2)

This tutorial explains how to set up a WordPress environment, using Docker
Compose, with the following four interconnected containers:

* database
* wordpress
* phpmyadmin
* wordmove

Don't forget to replace `image: mfuezesi/wordmove` with `image: 
simonbland/wordmove` to get the latest version of Wordmove.

## Known limitations

* If `sql_adapter` is set to `wpcli`, then the movefile must be in the same
  directory as the WordPress directory
* WP-CLI cannot be run as `root` unless the `--allow-root` flag is given, and
  Wordmove doesn't add this flag when calling WP-CLI; this is why the current
  user is `wordmove` instead of `root`, when starting this container

## Advanced usage

### To become root

Run `sudo su` and use `wordmove` as the password.

## TODO

* Base this image on a smaller image than Ubuntu
* Configure Webhooks to build this image on Docker Hub when a new version of
  the `wordmove` gem is available