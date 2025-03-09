#!/bin/bash

# Git Directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

rm -f $SCRIPT_DIR/themes/*
rm -f $SCRIPT_DIR/previews/*
