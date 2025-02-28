#!/bin/zsh

openssl genrsa -out keys/CA.key.pem 2048
openssl req -new -x509 -days 3650 -key keys/CA.key.pem -out certs/CA.cert.pem -subj "/C=US/ST=Florida/L=Gainesville/O=YourOrg/OU=YourUnit/CN=UF-CA/emailAddress=ca@uf.edu"

openssl genrsa -out keys/broker.key.pem 2048
openssl req -new -key keys/broker.key.pem -out certs/broker.csr.pem -config cnfs/broker_ext.cnf
openssl x509 -req -in certs/broker.csr.pem -CA certs/CA.cert.pem -CAkey keys/CA.key.pem -CAcreateserial -out certs/broker.cert.pem -days 365 -extfile cnfs/broker_ext.cnf -extensions v3_req

openssl genrsa -out keys/pub.key.pem 2048
openssl req -new -key keys/pub.key.pem -out certs/pub.csr.pem -config cnfs/pub_ext.cnf
openssl x509 -req -in certs/pub.csr.pem -CA certs/CA.cert.pem -CAkey keys/CA.key.pem -CAcreateserial -out certs/pub.cert.pem -days 365 -extfile cnfs/pub_ext.cnf -extensions v3_req

openssl genrsa -out keys/sub.key.pem 2048
openssl req -new -key keys/sub.key.pem -out certs/sub.csr.pem -config cnfs/sub_ext.cnf
openssl x509 -req -in certs/sub.csr.pem -CA certs/CA.cert.pem -CAkey keys/CA.key.pem -CAcreateserial -out certs/sub.cert.pem -days 365 -extfile cnfs/sub_ext.cnf -extensions v3_req
