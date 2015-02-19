## Kibana 4 Docker Image
This is a [million12/kibana4](https://registry.hub.docker.com/u/million12/docker-kibana4/) docker image with Kibana 4 for Elasticsearch. It's based on CentOS-7 and offers ability to provide any argument to kibana process. 

This container is built that any extra parameters provided to `docker run` will be passed directly to kibana command. For example, if you run `docker run [run options] million12/kibana4 -e http://elasticsearch_address:9200` you pass `-e http://elasticsearch_address:9200` to kibana daemon.

## ENV variables

#### KIBANA_CONFIG
Default: `KIBANA_CONFIG=/opt/kibana/config/kibana.yml`  
If you mount your config to different location, simply edit it.

## Usage
### Basic 
`docker run \`  
`-ti \`  
`-p 5601:5601 \`  
`million12/kibana4`

### Mount custom config , override some options
`docker run \`  
`-d \`  
`-p 5601:5601 \`  
`-v /my-kibana-config.yml:/opt/kibana/config/kibana.yml \`  
`million12/kibana4 \`  
`--elasticsearch http://elasticsearch_address:9200`  

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

**Sponsored by** [Typostrap.io - the new prototyping tool](http://typostrap.io/) for building highly-interactive prototypes of your website or web app. Built on top of TYPO3 Neos CMS and Zurb Foundation framework.
