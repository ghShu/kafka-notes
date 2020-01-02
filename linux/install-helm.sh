#!/bin/bash

# Follow the instruction in this Page:
# https://helm.sh/docs/intro/install/

# 1. Download your desired version

# 2. Unpack it 
tar -zxvf helm-v3.0.0-linux-amd64.tar.gz

# 3. Find the helm binary in the unpacked directory, and move it to its desired destination 
mv linux-amd64/helm /usr/local/bin/helm
# 4. From there, you should be able to run the client: 
helm help

helm version
