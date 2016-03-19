## Kibana 4 Docker Image
[![CircleCI Build Status](https://img.shields.io/circleci/project/million12/docker-kibana4/master.svg)](https://circleci.com/gh/million12/docker-kibana4/tree/master)  
[![GitHub Open Issues](https://img.shields.io/github/issues/million12/docker-kibana4.svg)](https://github.com/million12/docker-kibana4/issues)
[![GitHub Stars](https://img.shields.io/github/stars/million12/docker-kibana4.svg)](https://github.com/million12/docker-kibana4)
[![GitHub Forks](https://img.shields.io/github/forks/million12/docker-kibana4.svg)](https://github.com/million12/docker-kibana4)  
[![Stars on Docker Hub](https://img.shields.io/docker/stars/million12/kibana4.svg)](https://hub.docker.com/r/million12/kibana4)
[![Pulls on Docker Hub](https://img.shields.io/docker/pulls/million12/kibana4.svg)](https://hub.docker.com/r/million12/kibana4)  
[![Docker Layers](https://badge.imagelayers.io/million12/kibana4:latest.svg)](https://hub.docker.com/r/million12/kibana4)

 [![Deploy to Docker Cloud](https://files.cloud.docker.com/images/deploy-to-dockercloud.svg)](https://cloud.docker.com/stack/deploy/?repo=https://github.com/million12/docker-kibana4/tree/master)

This is a [million12/kibana4](https://registry.hub.docker.com/u/million12/kibana4/) docker image with Kibana 4 for Elasticsearch. It's based on CentOS-7 and offers ability to provide any argument to kibana process.

This container is built that any extra parameters provided to `docker run` will be passed directly to kibana command. For example, if you run `docker run [run options] million12/kibana4 -e http://elasticsearch_address:9200` you pass `-e http://elasticsearch_address:9200` to kibana daemon.

## ENV variables

#### KIBANA_CONFIG
Default: `KIBANA_CONFIG=/opt/kibana/config/kibana.yml`  
If you mount your config to different location, simply edit it.

`MARVEL_SUPPORT` - Add support for Marvel Plugin. (`true/false`). `false` is default.

2. Marvel [Docs](http://www.elasticsearch.org/overview/marvel/)



## Usage
### Basic

    docker run \
    -ti \
    -p 5601:5601 \
    million12/kibana4

### Mount custom config , override some options

    docker run \
    -d \
    -p 5601:5601 \
    -e MARVEL_SUPPORT=true \
    -v /my-kibana-config.yml:/opt/kibana/config/kibana.yml \
    million12/kibana4 \
    --elasticsearch http://elasticsearch_address:9200

Note: in this case config is mounted to its default location, so you don't need to modify `KIBANA_CONFIG` variable.

### Kibana CMD params
`kibana` command can be used with some parameters to define Elasticsearch address and port on which kibana should work. Simple `--help ` output below:   

	Usage: kibana [options]

	  Kibana is an open source (Apache Licensed), browser based analytics and search dashboard for Elasticsearch.

 	 Options:

    -h, --help                 output usage information
    -V, --version              output the version number
    -e, --elasticsearch <uri>  Elasticsearch instance
    -c, --config <path>        Path to the config file
    -p, --port <port>          The port to bind to
    -q, --quiet                Turns off logging
    -H, --host <host>          The host to bind to
    --plugins <path>           Path to scan for plugins

## Authors

Author: Marcin ryzy Ryzycki (<marcin@m12.io>)  
Author: Przemyslaw Ozgo (<linux@ozgo.info>)

---

**Sponsored by [Prototype Brewery](http://prototypebrewery.io/)** - the new prototyping tool for building highly-interactive prototypes of your website or web app. Built on top of [Neos CMS](https://www.neos.io/) and [Zurb Foundation](http://foundation.zurb.com/) framework.
