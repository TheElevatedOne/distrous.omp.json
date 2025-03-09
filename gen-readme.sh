#!/bin/bash

# Git Directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

python3 $SCRIPT_DIR/python/gen-readme.py
