#!/bin/bash

cp ../scratch/vividcortex.tar.xz .
docker build -t vcimage .
rm vividcortex.tar.xz
