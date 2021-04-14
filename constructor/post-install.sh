#!/usr/bin/env bash

# FORCING PREFIX
export PREFIX=${HOME}/omnisci-datascience

# Create ${HOME}/Documents/ if it doesn't exist.
mkdir -p ${HOME}/Documents/

echo "Creating a symlink fo omnisci-examples to user Documents folder ..."
ln -s ${PREFIX}/opt/omnisci-examples ${HOME}/Documents/
