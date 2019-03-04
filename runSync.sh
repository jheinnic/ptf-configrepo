#!/bin/sh

CONSUL_CONAINER_NAME=jchptf_consul-server_1
CONSUL_NETWORK_NAME=jchptf_portfolio

CONSUL_IP=$(docker inspect --format "{{ .NetworkSettings.Networks.${CONSUL_NETWORK_NAME}.IPAddress }}" ${CONSUL_CONAINER_NAME})

docker run -d --name git2consul -v `pwd`/git2consul.d:/etc/git2consul.d --network ${CONSUL_NETWORK_NAME} cimpress/git2consul --endpoint $CONSUL_IP --port 8500 --config-file /etc/git2consul.d/config.json
