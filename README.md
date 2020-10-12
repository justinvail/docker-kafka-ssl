# docker-kafka-ssl

Enables 2 ways SSL communication on Kafka.

Note that Kafka only support 2 ways SSL with a **SINGLE CA ROOT**,

Port 9094 is 2 ways SSL client authenticated and encrypted.

## Requirements

* openssl
* keytool
* docker
* docker-compose
* kafka command line tools
  
      brew install kafka

## Setup Instructions

add to your /etc/hosts

    127.0.0.1 kafka.docker.ssl

Generate the required certificates and keystores:

    ./scripts/generate_kafka_ssl_certs.sh
    
Move client certificates and keystores to the appropriate locations:

    ./scripts/moveCerts.sh
    
Run Kafka and Zookeeper

    docker-compose up

Verify the SSL connection

    openssl s_client -debug -connect kafka.docker.ssl:9094 -tls1

In the output of this command you should see server's certificate, such as:

```
-----BEGIN CERTIFICATE-----
{variable sized random bytes}
-----END CERTIFICATE-----
subject=/C=US/ST=CA/L=Santa Clara/O=org/OU=org/CN=Sriharsha Chintalapani
issuer=/C=US/ST=CA/L=Santa Clara/O=org/OU=org/CN=kafka/emailAddress=test@test.com
```

## Produce and Consume some encrypted messages
    
```
cd client
./local_consumer.sh
./local_producer.sh
```


## Kafka implicit configurations
This configuration is handled by the docker-compose.yml properties.
The container server.properties reflects the properties below.

### Server

```
ssl.truststore.location=/var/private/ssl/kafka.server.truststore.jks
ssl.truststore.password=kafkadocker
ssl.keystore.location=/var/private/ssl/kafka.server.keystore.jks
ssl.keystore.password=kafkadocker
ssl.key.password=kafkadocker
ssl.client.auth=required
```

### Client

```
security.protocol=SSL
ssl.truststore.location=/certs/docker.kafka.client.truststore.jks
ssl.truststore.password=kafkadocker
ssl.keystore.location=/certs/docker.kafka.client.keystore.jks
ssl.keystore.password=kafkadocker
ssl.key.password=kafkadocker
```

