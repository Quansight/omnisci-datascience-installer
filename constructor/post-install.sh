#!/usr/bin/env bash

export PATH=$PREFIX/bin:$PATH

pip install ibis-vega-transform

jupyter labextension install ibis-vega-transform
jupyter labextension install @pyviz/jupyterlab_pyviz
