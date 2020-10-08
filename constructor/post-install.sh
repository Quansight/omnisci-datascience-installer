#!/usr/bin/env bash

$PREFIX/bin/python -m pip install ibis-vega-transform

$PREFIX/bin/jupyter labextension install ibis-vega-transform
$PREFIX/bin/jupyter labextension install @pyviz/jupyterlab_pyviz
