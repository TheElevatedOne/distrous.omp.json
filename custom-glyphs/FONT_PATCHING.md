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
  - or to the `./fonts/` directory if you want to patch more at once
5. Run the script via the instructions

```
> patch-font.sh [-h|--help] [-m] [font-file] [font-name]
  ---------------------------------------------------
  [font-file] ↦ '.otf', '.ttf' font file path
  [font-name] ↦ output filename (without spaces)
              ↳ not required
  ---------------------------------------------------
  [-m] ↦ Multiple files trigger
  [font-file] ↦ directory of '.ttf', '.otf' files
              ↳ in the same basedir; without '/' at the end
  [font-name] ↦ CANNOT BE USED
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
7. [RECOMMENED] Or run `./patch-font.sh -m fonts` for Multiple patches
  - Best to use, since terminals use regular, italics and bold fonts
