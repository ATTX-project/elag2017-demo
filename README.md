# ELAG 2017 Demo and Presentation

ELAG2017 Demo of ATTX project with the title: _"Putting Linked Data to Work:
Semantic Data "Brokering" in Practice"_

* ATTX Project website: https://www.helsinki.fi/en/projects/attx-2016
* ATTX Project documentation: https://attx-project.github.io/

In order to run the demo in the current repository VirtualBox is required with extension utils. On Ubuntu the following commands would be of help:
* `sudo apt-get install -y virtualbox virtualbox-ext-pack virtualbox-dkms`

Steps for running the demo:
1. Create a three-node Docker Swarm: `./docker-machine-Swarm.sh`
2. Set the localhost terminal to redirect Docker commands to the newly created Swarm master ("attx-swarm-1"): `eval $(docker-machine env attx-swarm-1)`
3. Deploy the ATTX stack `docker stack deploy -c attx-swarm.yml attx`
4. If the UnifiedViews UI (`http://<attx-swarm-1_IP>:8080/unifiedviews/`) is down, one can restart it by running the following commands:
    * run `docker service scale attx_frontend=0`;
    * wait for ~10 seconds;
    * run `docker service scale attx_frontend=1`.

For more information on how to make use of the demo: https://attx-project.github.io/Consul-for-Service-Discovery-on-Docker-Swarm.html (without the service registration part).
