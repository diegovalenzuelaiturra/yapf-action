#!/bin/sh -l
set -e
echo "Entrypoint got the following args : $*"
sh -c "yapf $*"
