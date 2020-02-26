# Cloud-hole

Cloud-hole is in essence a [Pi-hole](https://github.com/pi-hole/docker-pi-hole) readied to be exposed to the internet. It features SSL for the Pi-hole admin interface and [DNS over TLS](https://de.wikipedia.org/wiki/DNS_over_TLS). The project is inspired by [Sky-hole](https://github.com/kquinsland/skyhole/).

## Getting Started

To get a look at the project you just need to pull a copy of this repo and make you sure you meet the prerequisites. More information about the components used can the found in the components section.

### Prerequisites

* Docker Engine 18.06.0+
* Docker Compose
* Bash

### Installing

To get started the [bootstrap.sh](https://github.com/Joker9944/cloud-hole/blob/master/bootstrap.sh) script with the admin interface password as the first parameter must be run.

```
./bootstrap.sh example_password
```

It will setup the following:

* Traefik ACME store with proper permissions
* Basic auth for the Pi-hole admin interface
* Copy the example ```.env``` file to be edited
* Pull needed docker images
* Build intermediate docker images

After the script is done all relevant variables can be edited in ```.env``` file.

Run ```docker-compose up``` and enjoy.

## Deployment

For setup on [GCP](https://cloud.google.com/) see the [startup.sh](https://github.com/Joker9944/cloud-hole/blob/master/startup.sh) script.

To enable logging to the [GCP Stackdriver](https://cloud.google.com/stackdriver/?hl=en) the ```.env``` variable ```LOG_DRIVER``` can be set to ```gcplogs```.

## Future work

* Client authentication with self signed certificates
* [Promeuteus](https://prometheus.io/) monitoring

## Components

* [Pi-hole](https://github.com/pi-hole/docker-pi-hole) - The heart of the service and responsible for blocking advertisement and tracking
* [Traefik](https://github.com/containous/traefik) - Reverse proxy for the Pi-hole admin interface and responsible for SSL certificates
* [CoreDNS](https://github.com/coredns/coredns) - DNS proxy and responsible for DNS TLS terminination

## Acknowledgments

* Inspired by [Cloud-hole](https://github.com/kquinsland/skyhole/)
* If you enjoy Pi-hole consider [donating](https://pi-hole.net/donate/) ❤️
