# ELAG 2017 Demo and Presentation

ELAG2017 Demo of ATTX project with the title: _"Putting Linked Data to Work:
Semantic Data "Brokering" in Practice"_

* ATTX Project website: https://www.helsinki.fi/en/projects/attx-2016
* ATTX Project documentation: https://attx-project.github.io/

In order to run the demo in the current repository VirtualBox is required with extension utils. On Ubuntu the following commands would be of help:
* `sudo apt-get install -y virtualbox virtualbox-ext-pack virtualbox-dkms`

Steps for running the demo:
1. Deploy nodes `./docker-machine-Swarm.sh`
2. Deploy attx stack `docker stack deploy -c attx-swarm.yml attx`
3. If `attx_frontend` is down one can restart it by following:
    * run `docker service scale attx_frontend=0`;
    * wait for 30 seconds;
    * run `docker service scale attx_frontend=1`.

For more information on how to make use of the demo: https://attx-project.github.io/Consul-for-Service-Discovery-on-Docker-Swarm.html (without the service registration part).
