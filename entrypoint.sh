#!/bin/sh -l
set -e
echo $*
sh -c "yapf $*"
