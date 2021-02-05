#!/usr/bin/env bash

export OLD_PATH=${PREFIX}
export PATH=${PREFIX}/bin:${PATH}

pip install ibis-vega-transform jaeger-browser

jupyter labextension install ibis-vega-transform
jupyter labextension install @pyviz/jupyterlab_pyviz

echo "Creating a symlink fo omnisci-examples to user Documents folder ..."
ln -s ${PREFIX}/opt/omnisci-examples to ${HOME}/Documents/

export PATH=${OLD_PATH}
