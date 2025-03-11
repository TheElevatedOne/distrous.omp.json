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

# Progress Bar Data
source $SCRIPT_DIR/bash_progress_bar/progress_bar.sh
FILES=$(ls $SCRIPT_DIR/themes/ | wc -l)
MIN=$(expr 100 / $FILES)
COUNT=1
enable_trapping
ETA_ENABLED="true"
setup_scroll_area "Generating" 100

for theme in $(ls $SCRIPT_DIR/themes/); do
  draw_progress_bar $(expr $COUNT \* $MIN) ""

  printf "${GREEN}[Generating Preview]${NC} $theme\n"
  oh-my-posh --config "$SCRIPT_DIR/themes/$theme" config export image --author ELEVATED --background-color "#0d0f18" --output "$SCRIPT_DIR/previews/$theme.png"
  cd ..
  oh-my-posh --config "$SCRIPT_DIR/themes/$theme" config export image --author ELEVATED --background-color "#0d0f18" --output "$SCRIPT_DIR/previews/$theme-general.png"
  sudo -s oh-my-posh --config "$SCRIPT_DIR/themes/$theme" config export image --author ELEVATED --background-color "#0d0f18" --output "$SCRIPT_DIR/previews/$theme-root.png"
  cd $SCRIPT_DIR/env/unwritable_dir
  oh-my-posh --config "$SCRIPT_DIR/themes/$theme" config export image --author ELEVATED --background-color "#0d0f18" --output "$SCRIPT_DIR/previews/$theme-unwrite.png"
  cd $SCRIPT_DIR/python
  oh-my-posh --config "$SCRIPT_DIR/themes/$theme" config export image --author ELEVATED --background-color "#0d0f18" --output "$SCRIPT_DIR/previews/$theme-script.png"
  cd $SCRIPT_DIR
  source $SCRIPT_DIR/env/python_venv/bin/activate
  oh-my-posh --config "$SCRIPT_DIR/themes/$theme" config export image --author ELEVATED --background-color "#0d0f18" --output "$SCRIPT_DIR/previews/$theme-venv.png"
  deactivate

  COUNT=$(expr $COUNT + 1)
done

destroy_scroll_area

printf "\n"
