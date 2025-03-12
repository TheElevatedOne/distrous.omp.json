# Font Patching

There are distros that do not have their icons included in default nerdfonts.

This is a patch for those distros.

## Distros

> Open an enhancement issue if you want your distro to be included

- CachyOS

## Generation

1. Clone the directory via `git clone --recurse-submodules https://github.com/TheElevatedOne/distrous.omp.json`
2. `cd custom-glyphs`
3. You will see a bash script, a fontforge project and a glyph-dir
  - If you want to edit the icons, open the fontforge project and save it to glyph-dir
4. Copy a NerdFont you use to this directory
5. Run the script via the instructions

```
> patch-font.sh [-h|--help] [font-file] [font-name]
  ---------------------------------------------------
  [font-file] ↦ '.otf', '.ttf' font file path
  [font-name] ↦ output filename (without spaces)
              ↳ not required
  ---------------------------------------------------
  Asks User to install required packages.
  > Packages: curl, unzip, fontforge, python3
  Downloads font-patcher from nerdfonts repo
  Patches the input font with glyphs from glyph-dir
  > Glyphs: custom distro logos
  Outputs to './out/ with the font-name user input
```

6. Run `./patch-font.sh <font-file> <font-name>`

- For my config I run `./patch-font.sh LiterationMonoNerdFontMono-Regular.ttf LiterationMonoCustom-Regular`
- If you don't input a name, the font will be named `PatchedFont`
