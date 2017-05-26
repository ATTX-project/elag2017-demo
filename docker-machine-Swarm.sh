for i in 1 2 3; do
  docker-machine create -d virtualbox --virtualbox-memory "2048" node-$i
done

eval $(docker-machine env node-1)

docker swarm init \
  --advertise-addr $(docker-machine ip node-1)

TOKEN=$(docker swarm join-token -q worker)

for i in 2 3; do
  eval $(docker-machine env node-$i)

  docker swarm join \
    --token $TOKEN \
    --advertise-addr $(docker-machine ip node-$i) \
    $(docker-machine ip node-1):2377
done

echo ">> The Docker Machine Swarm is up and running"
