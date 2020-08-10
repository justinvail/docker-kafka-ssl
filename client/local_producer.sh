#!/bin/bash
now=$(date +"%T")
echo "new message sent to Kafka test topic at: $now" | kafka-console-producer --broker-list kafka+ssl://kafka.docker.ssl:9094 --topic test --producer.config ./local_client_ssl.properties
