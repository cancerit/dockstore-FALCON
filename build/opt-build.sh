#! /bin/bash

set -ex

if [[ -z "${TMPDIR}" ]]; then
  TMPDIR=/tmp
fi

if [ "$#" -lt "1" ] ; then
  echo "Please provide an installation path such as /opt/CASM"
  exit 1
fi

INST_PATH=$1
mkdir -p $1
INST_PATH=`(cd $1 && pwd)`
echo $INST_PATH

set -u

#First install miniconda
wget -q https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
bash Miniconda2-latest-Linux-x86_64.sh\
    -b -f -p $INST_PATH
export PATH=$INST_PATH/bin:$PATH
conda config --add channels defaults
conda config --add channels bioconda
#This allows installatino of the pb-assembly package
conda install -y pb-assembly

#Now install the FALCON-formatter code

git clone https://github.com/zyndagj/FALCON-formatter
cd FALCON-formatter
python setup.py install --prefix $INST_PATH
