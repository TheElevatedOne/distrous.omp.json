#!/bin/bash

# Git Directory
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# Colors
RED='\033[0;31m'
BLUE='\033[1;34m'
GREEN='\033[0;32m'
NC='\033[0m'

if ! command -v oh-my-posh 2>&1 >/dev/null; then
  printf "${RED}[ERROR]${NC} ${BLUE}oh-my-posh${NC} binary not found / not on \$PATH.\nExiting...\n\n"
  exit 1
fi

for theme in $(ls $SCRIPT_DIR/themes/); do
  printf "${GREEN}[Generating Preview]${NC} $theme\n"
  oh-my-posh --config "$SCRIPT_DIR/themes/$theme" config export image --author ELEVATED --background-color "#0d0f18" --output "$SCRIPT_DIR/previews/$theme.png"
  cd ..
  oh-my-posh --config "$SCRIPT_DIR/themes/$theme" config export image --author ELEVATED --background-color "#0d0f18" --output "$SCRIPT_DIR/previews/$theme-general.png"
  cd $SCRIPT_DIR/env/unwritable_dir
  oh-my-posh --config "$SCRIPT_DIR/themes/$theme" config export image --author ELEVATED --background-color "#0d0f18" --output "$SCRIPT_DIR/previews/$theme-unwrite.png"
  cd $SCRIPT_DIR
  source $SCRIPT_DIR/env/python_venv/bin/activate
  oh-my-posh --config "$SCRIPT_DIR/themes/$theme" config export image --author ELEVATED --background-color "#0d0f18" --output "$SCRIPT_DIR/previews/$theme-venv.png"
  deactivate
done

printf "\n"
