#!/usr/bin/env bash


# NOTE: If you get build errors related to python interpreter check under Linux then run the following command:
# export WITH_PYTHON_INTERP_CHECK=ON

# ====================================================
# import the utils 
. bash_utils.sh 

# ====================================================

#set -e

#echo ROOT_DIR: $ROOT_DIR
cd $ROOT_DIR  # from bash_utils.sh

# ====================================================
# check if we have external options
EXTERNAL_OPTIONS=$@
if [[ -n "$EXTERNAL_OPTIONS" ]]; then
    echo "external option: $EXTERNAL_OPTIONS" 
fi

# check if we want to add a python interpreter check
if [[ -n "$WITH_PYTHON_INTERP_CHECK" ]]; then
    echo "WITH_PYTHON_INTERP_CHECK: $WITH_PYTHON_INTERP_CHECK " 
    EXTERNAL_OPTIONS="$EXTERNAL_OPTIONS -DWITH_PYTHON_INTERP_CHECK=$WITH_PYTHON_INTERP_CHECK"
fi


OpenCV_DIR="$ROOT_DIR/thirdparty/opencv/install/lib/cmake/opencv4"
if [[ -d "$OpenCV_DIR" ]]; then
    EXTERNAL_OPTIONS="$EXTERNAL_OPTIONS -DOpenCV_DIR=$OpenCV_DIR"
fi 

echo "EXTERNAL_OPTIONS: $EXTERNAL_OPTIONS"

# ====================================================
# check if want to use conda or venv
if [ -z $USING_CONDA_PYSLAM ]; then
    if [[ -z "${USE_PYSLAM_ENV}" ]]; then
        USE_PYSLAM_ENV=0
    fi
    if [ $USE_PYSLAM_ENV -eq 1 ]; then
        . pyenv-activate.sh
    fi  
else 
    echo "Using conda pyslam..."
    . pyenv-conda-activate.sh
fi 

print_blue '================================================'
print_blue "Building and installing cpp ..."

CURRENT_USED_PYENV=$(get_virtualenv_name)
print_blue "currently used pyenv: $CURRENT_USED_PYENV"

cd cpp 

# build utils 
cd utils 
. build.sh $EXTERNAL_OPTIONS       # use . in order to inherit python env configuration 
cd ..

cd .. 


# NOTE: If you get build errors related to python interpreter check under Linux then run the following command:
# export WITH_PYTHON_INTERP_CHECK=ON