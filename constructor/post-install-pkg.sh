#!/usr/bin/env bash

# FORCING PREFIX
export PREFIX=${HOME}/omnisci-datascience

export OLD_PATH=${PREFIX}
export PATH=${PREFIX}/bin:${PATH}

${PREFIX}/bin/pip install ibis-vega-transform jaeger-browser

${PREFIX}/bin/jupyter labextension install ibis-vega-transform
${PREFIX}/bin/jupyter labextension install @pyviz/jupyterlab_pyviz

echo "Creating a symlink fo omnisci-examples to user Documents folder ..."
ln -s ${PREFIX}/opt/omnisci-examples to ${HOME}/Documents/

export PATH=${OLD_PATH}
