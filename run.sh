#!/bin/zsh

mosquitto -c mosquitto.conf -v

osascript -e 'tell application "Terminal" to do script "mosquitto_sub -p 8883 -h localhost -t "lab3topic" --cert certs/sub.cert.pem --key keys/sub.key.pem --cafile certs/CA.cert.pem -d; exec zsh"'

osascript -e 'tell application "Terminal" to do script "mosquitto_pub -p 8883 -h localhost -t "lab3topic" -m "test message" --cert certs/pub.cert.pem --key keys/pub.key.pem --cafile certs/CA.cert.pem -d; exec zsh"'
