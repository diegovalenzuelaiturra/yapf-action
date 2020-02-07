#!/bin/bash
set -e

echo "Entrypoint got the following args : $*"
bash -c "yapf $*"
