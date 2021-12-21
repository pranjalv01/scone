#!/bin/bash

# Delete containers and volume data:
docker-compose down --remove-orphans

# Remove encyrpted input and output
sudo rm -vrf volumes/encrypted-output
sudo rm -vrf volumes/encrypted-input

# Remove old dataset and download new dataset
sudo rm -vrf volumes/data/datasets/*
cd volumes/data/datasets/ && wget -c https://www.cs.toronto.edu/~kriz/cifar-10-python.tar.gz
tar -xvzf cifar-10-python.tar.gz
mv cifar-10-python.tar.gz cifar-10-batches-py.tar.gz