# Docker Image for Irssi
[![](https://github.com/seiferma/Docker_Irssi/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/seiferma/Docker_Irssi/actions?query=branch%3Amain+)
[![](https://img.shields.io/github/issues/seiferma/Docker_Irssi.svg)](https://github.com/seiferma/Docker_Irssi/issues)
[![](https://img.shields.io/github/license/seiferma/Docker_Irssi.svg)](https://github.com/seiferma/Docker_Irssi/blob/main/LICENSE)

The image contains the IRC client irssi. The image ensures that all connections are made through tor to protect the privacy while chatting.

The image exposes a web interface at port 8080, through which the client can be accessed via a browser terminal. Please note that there is no access control or any other security mechanism. Please ensure security by limiting access to the web interface via a reverse proxy.

In order to run this (and derived) images, you have to ensure that
* the container is started with capabilities NET_ADMIN and NET_RAW

The image is available as `quay.io/seiferma/irssi-tor`. View all available tags on [quay.io](https://quay.io/repository/seiferma/irssi-tor?tab=tags).
