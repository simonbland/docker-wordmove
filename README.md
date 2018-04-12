Docker image to run [Wordmove](https://welaika.github.io/wordmove/).

[![Slack channel](https://img.shields.io/badge/Slack-WP--Hub-blue.svg)](https://wphub-auto-invitation.herokuapp.com/)

## What's inside

* ubuntu 14.04
* openssh-server
* curl
* rsync
* wordmove
* mysql-client-5.5
* php5
* wp-cli
* ENV RUBYOPT="-KU -E utf-8:utf-8" (Fix for some mysql sync issues when using old
  db adapter)

## How to use

### To run this image

`docker run -it --rm -v ~/.ssh:/home/wordmove/.ssh:ro welaika/wordmove`

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
welaika/wordmove` to get the latest version of Wordmove.

## Known limitations

* If `sql_adapter` is set to `wpcli`, then the movefile must be in the same
  directory as the WordPress directory

## Advanced usage

### To become root

Run `sudo su` and use `wordmove` as the password.

## TODO

* Release the Alpine version of this image
* Configure Webhooks to build this image on Docker Hub when a new version of
  the `wordmove` gem is available

## Credits 🙏🏻

Based on [mfuezesi/docker-wordmove](
https://github.com/mfuezesi/docker-wordmove), with WP-CLI support added.

## Maintainers

@simonbland and @welaika dev team 😎
