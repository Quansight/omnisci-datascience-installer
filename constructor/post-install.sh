#!/usr/bin/env bash

export OLD_PATH=$PREFIX
export PATH=$PREFIX/bin:$PATH

python -m pip install ibis-vega-transform

jupyter labextension install ibis-vega-transform
jupyter labextension install @pyviz/jupyterlab_pyviz


pip install \
    git+https://github.com/ibis-project/ibis@10d40305defc7337d217b595c4b6b74e66d153da \
    git+https://github.com/holoviz/holoviews.git@refs/pull/4517/head \
    git+https://github.com/holoviz/hvplot.git@refs/pull/507/head

export PATH=$OLD_PATH
