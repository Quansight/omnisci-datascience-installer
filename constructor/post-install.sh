#!/usr/bin/env bash

export OLD_PATH=$PREFIX
export PATH=$PREFIX/bin:$PATH

python -m pip install ibis-vega-transform

jupyter labextension install ibis-vega-transform
jupyter labextension install @pyviz/jupyterlab_pyviz

export PATH=$OLD_PATH
