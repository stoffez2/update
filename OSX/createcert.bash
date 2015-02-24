#!/bin/bash

## cd to PlexConnect directory
cd __INSTALLERPATH__
cd ../..
PlexConnectPath=${PWD}

stopbash.bash

## check SSL certificate
file="${PlexConnectPath}/assets/certificates/trailers.pem"
if [ -f "$file" ]; then
    echo 'SSL certificate '$file' found. Skipping' 
    echo 'Settings.cfg changed to hijack trailers.apple.com'
    echo 'Upload profile to ATV using this url http://trailers.apple.com/trailers.cer'
else

## Trailers - hostname is trailers.apple.com
## certificate good for 10 years
openssl req -new -nodes -newkey rsa:2048 -out ./assets/certificates/trailers.pem -keyout ./assets/certificates/trailers.key -x509 -days 3650 -subj "/C=US/CN=trailers.apple.com"
openssl x509 -in ./assets/certificates/trailers.pem -outform der -out ./assets/certificates/trailers.cer && cat ./assets/certificates/trailers.key >> ./assets/certificates/trailers.pem

echo 'Generating Trailers certs'
echo 'Settings.cfg changed to hijack trailers.apple.com'
echo 'Upload profile to ATV using this url http://trailers.apple.com/trailers.cer'

