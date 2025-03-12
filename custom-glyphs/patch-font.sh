#!/bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

if [ "$1" == "" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  printf "\e[1;37m>\e[0m \e[1;32mpatch-font.sh\e[0m \e[1;31m[-h|--help]\e[0m \e[1;33m[font-file] [font-name]\e[0m\n"
  printf "  ---------------------------------------------------\n"
  printf "  \e[36m[font-file]\e[0m \u21A6 '.otf', '.ttf' font file path\n"
  printf "  \e[36m[font-name]\e[0m \u21A6 output filename (without spaces)\n"
  printf "              \u21B3 not required\n"
  printf "  ---------------------------------------------------\n"
  printf "  \e[1mAsks User to install required packages.\e[0m\n"
  printf "  > \e[4mPackages:\e[0m \e[1;33mcurl, unzip, fontforge, python3\e[0m\n"
  printf "  \e[1mDownloads font-patcher from nerdfonts repo\n"
  printf "  Patches the input font with glyphs from glyph-dir\e[0m\n"
  printf "  > \e[4mGlyphs:\e[0m custom distro logos\n"
  printf "  \e[1mOutputs to './out/ with the font-name user input\e[0m\n"
  printf "\n"
  exit 0
fi

if [ "$1" == *"ttf"* ] || [ "$1" == *"otf"* ]; then
  font_file=$SCRIPT_DIR/$1
else
  printf "\e[1;31m[ERROR]\e[0m Unsupported font file\n"
  exit 1
fi

if [ "$2" != "" ]; then
  font_name=$2
else
  font_name="PatchedFont"
fi

while true; do
  if ! command -v curl 2>&1 >/dev/null || ! command -v python3 2>&1 >/dev/null || ! command -v fontforge 2>&1 >/dev/null || ! command -v unzip 2>&1 >/dev/null; then
    printf "One or more packages are not installed! [curl, python3, fontforge, unzip]\n"
    printf "Install them in a separate terminal and press Enter!\n\n"
    read -sp "Continue?" yn
    printf "\n"
  fi
  printf "packages installed, continuing...\n"
  break
done

curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FontPatcher.zip --output FontPatcher.zip
unzip FontPatcher.zip
rm FontPatcher.zip

# Run fontforge
fontforge -script font-patcher --custom $SCRIPT_DIR/glyph-dir/font-logos.ttf --out $SCRIPT_DIR/out/ --name $font_name $font_file

rm -rf $SCRIPT_DIR/bin/ $SCRIPT_DIR/src/ $SCRIPT_DIR/font-patcher $SCRIPT_DIR/glyphnames.json $SCRIPT_DIR/readme.md
