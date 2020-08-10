#!/bin/bash
kafka-console-consumer --bootstrap-server kafka.docker.ssl:9094 --topic test --consumer.config ./local_client_ssl.properties --from-beginning