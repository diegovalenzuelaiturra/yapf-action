#!/bin/bash
set -e

echo $(pwd)

echo $(ls)

echo "Entrypoint got the following args : $*"

bash -c "yapf $*"
