#!/bin/bash

# Git Directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

sh $SCRIPT_DIR/distrous.sh

sh $SCRIPT_DIR/gen-previews.sh

sh $SCRIPT_DIR/gen-readme.sh
