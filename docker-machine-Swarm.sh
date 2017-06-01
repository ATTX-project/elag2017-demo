begin=$(date +%s)

for i in 1 2 3; do
  docker-machine create -d virtualbox --virtualbox-memory "4096" attx-swarm-$i
done

eval $(docker-machine env attx-swarm-1)

docker swarm init \
  --advertise-addr $(docker-machine ip attx-swarm-1)

TOKEN=$(docker swarm join-token -q worker)

for i in 2 3; do
  eval $(docker-machine env attx-swarm-$i)

  docker swarm join \
    --token $TOKEN \
    --advertise-addr $(docker-machine ip attx-swarm-$i) \
    $(docker-machine ip attx-swarm-1):2377
done
end=$(date +%s)

echo ">> The Docker Machine Swarm is up and running"

tottime=$(expr $end - $begin)
echo ">> It took $tottime seconds to start the ATTX Swarm."
