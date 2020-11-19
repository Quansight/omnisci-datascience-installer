#!/usr/bin/env bash
set -ex

PROJECT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
OMNISCI_EXAMPLE_DIR=${PROJECT_DIR}/omnisci-examples
NOTEBOOK_DIR=${OMNISCI_EXAMPLE_DIR}/notebooks
NBCONVERT=${CONDA_PREFIX}/bin/jupyter-nbconvert
OUTPUT_DIR=${PROJECT_DIR}/tmp

# force a fresh copy of the omnisci-examples repository
rm -rf ${OMNISCI_EXAMPLE_DIR}
git clone --depth 1 https://github.com/Quansight/omnisci-examples.git

mkdir -p tmp

find ${OMNISCI_EXAMPLE_DIR} -type f \( -iname "*.ipynb" ! -iname "*checkpoint.ipynb" \) | while read f
do
    if \
        # this notebook run a local docker compose and it is not necessary for the tests
        [ "$f" == "${NOTEBOOK_DIR}/01_Introduction.ipynb" ] || \
        # these notebooks connect to omnisci using localhost address
        [ "$f" == "${NOTEBOOK_DIR}/additional_examples/A01_Getting_Started_OmniSciDB_and_Ibis.ipynb" ] || \
        [ "$f" == "${NOTEBOOK_DIR}/additional_examples/A02_Omnisci_Runtime_UDF.ipynb" ] || \
        [ "$f" == "${NOTEBOOK_DIR}/02_Querying_Data.ipynb" ] || \
        [ "$f" == "${NOTEBOOK_DIR}/04_Advanced-Using_UDFs_and_UDTFs.ipynb" ] || \
        [ "$f" == "${NOTEBOOK_DIR}/workshop/User_Defined_Algorithms_on_Big_Data.ipynb" ] \
        # pymapd has problems to deal with some data from demo_vote_clean table
        # 'utf-8' codec can't decode byte
        [ "$f" == "${NOTEBOOK_DIR}/workshop/Altair_Ibis_Vega_for_Interactive_Exploration.ipynb" ] || \
        [ "$f" == "${NOTEBOOK_DIR}/workshop/Connecting_Holoviz_Visualization_Ecosystem_to_OmniSci_part_1.ipynb" ] \
    ; then
        echo "[II] Skipping ${f}"
        continue;
    fi

    ${NBCONVERT} --to notebook --execute --output ${OUTPUT_DIR}/test.html ${f}
    if [ $? -ne 0 ]
    then
        break
    fi
done

set +ex
