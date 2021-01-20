#!/usr/bin/env bash

export OLD_PATH=${PREFIX}
export PATH=${PREFIX}/bin:${PATH}

pip install intake-omnisci
pip install ibis-vega-transform

jupyter labextension install ibis-vega-transform
jupyter labextension install @pyviz/jupyterlab_pyviz

export PATH=${OLD_PATH}

USER_NOTEBOOKS_DIR=${HOME}/Documents/omnisci-datascience/notebooks
mkdir -p ${USER_NOTEBOOKS_DIR}
ln -s ${PREFIX}/opt/omnisci/notebooks ${USER_NOTEBOOKS_DIR}
