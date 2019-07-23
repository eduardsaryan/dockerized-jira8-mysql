#!/bin/bash

# Create directory for certificates (if not exist)
[[ -d certs ]] || mkdir certs

# Define source
source .env.certs

# Generate new CA certificate ca.pem file.
openssl genrsa 2048 > certs/ca-key.pem
openssl req -new -x509 -nodes -days 3600 \
    -subj "${OPENSSL_CA}" \
    -key certs/ca-key.pem -out certs/ca.pem

# Create the server-side certificates
openssl req -newkey rsa:2048 -days 3600 -nodes \
    -subj "${OPENSSL_SERVER}" \
    -keyout certs/server-key.pem -out certs/server-req.pem
openssl rsa -in certs/server-key.pem -out certs/server-key.pem
openssl x509 -req -in certs/server-req.pem -days 3600 \
    -CA certs/ca.pem -CAkey certs/ca-key.pem -set_serial 01 -out certs/server-cert.pem

# Create the client-side certificates
openssl req -newkey rsa:2048 -days 3600 -nodes \
    -subj "${OPENSSL_CLIENT}" \
    -keyout certs/client-key.pem -out certs/client-req.pem
openssl rsa -in certs/client-key.pem -out certs/client-key.pem
openssl x509 -req -in certs/client-req.pem -days 3600 \
    -CA certs/ca.pem -CAkey certs/ca-key.pem -set_serial 01 -out certs/client-cert.pem

# Verify the certificates are correct
openssl verify -CAfile certs/ca.pem certs/server-cert.pem certs/client-cert.pem
