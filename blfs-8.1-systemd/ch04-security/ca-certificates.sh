#!/bin/bash

cd /tmp	

wget http://anduin.linuxfromscratch.org/BLFS/other/make-ca.sh-20170514
wget http://anduin.linuxfromscratch.org/BLFS/other/certdata.txt

install -vdm755 /etc/ssl/local &&
wget http://www.cacert.org/certs/root.crt &&
openssl x509 -in root.crt -text -fingerprint -setalias "CAcert Class 1 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_1_root.pem &&
install -vm755 make-ca.sh-20170514 /usr/sbin/make-ca.sh
/usr/sbin/make-ca.sh --force

rm -r /tmp/*
