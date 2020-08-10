#!/bin/bash

#move client certs to certs_client
mv -f ./sslcerts/docker.kafka.client.keystore.jks ../certs_client;
mv -f ./sslcerts/docker.kafka.client.keystore.p12 ../certs_client;
mv -f ./sslcerts/docker.kafka.client.truststore.jks ../certs_client;

#move server certs to certs
mv -f ./sslcerts/ca-hw-cert ../certs;
mv -f ./sslcerts/ca-hw-cert.srl ../certs;
mv -f ./sslcerts/ca-hw-key ../certs;
mv -f ./sslcerts/cert-file ../certs;
mv -f ./sslcerts/cert-signed ../certs;
mv -f ./sslcerts/client.ca-bundle.crt ../certs;
mv -f ./sslcerts/client.key ../certs;
mv -f ./sslcerts/client.pem ../certs;
mv -f ./sslcerts/docker.kafka.server.keystore.jks ../certs;
mv -f ./sslcerts/docker.kafka.server.truststore.jks ../certs;

#delete empty directory
rmdir ./sslcerts;