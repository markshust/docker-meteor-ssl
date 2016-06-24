# Nginx SSL Frontend for Meteor

This is an nginx proxy that will serve as SSL termination for a meteor app.

    docker pull markoshust/meteor-ssl

## bundle.crt

This is a bundle containing all of your certificates including the provided CA certificates. To create this file you need to concatenate all certificates starting from your domain certificate to the top level CA certificates. Here's an example:

    cat domain.com.crt COMODORSADomainValidationSecureServerCA.crt COMODORSAAddTrustCA.crt AddTrustExternalCARoot.crt > bundle.crt

## dhparams.pem

Generate your own dhparams.pem file, unique for your app:

    openssl dhparam -out dhparams.pem 2048

## Usage

    docker run -d -v /root/bundle.crt:/bundle.crt -v /root/private.key:/private.key -v /root/dhparams.pem:/dhparams.pem --link=myapp:meteor -p 80:80 -p 443:443 markoshust/meteor-ssl
