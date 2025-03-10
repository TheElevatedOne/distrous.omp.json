# distrous.omp.json

Oh-My-Posh Theme with Distro-based Color schemes.

Based on [kushal.omp.json](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/kushal.omp.json).

---

## Navigation

- [**Preview**](#preview)
- [**Distros**](#distros)
- [**Documentation**](#documentation)

---

## Preview

### Previews for All Themes Here: [<ins>PREVIEWS.md</ins>](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/PREVIEWS.md)

### EndeavourOS - Example

> ![endeavouros-preview](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-endeavouros.omp.json.png?raw=true)

**Link to file:** [distrous-endeavouros.omp.json](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/themes/distrous-endeavouros.omp.json?raw=true)

<details>
    <summary>Extra</summary>

- **General**

    > ![endeavouros-general](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-endeavouros.omp.json-general.png?raw=true)

- **Root**

    > ![endeavouros-root](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-endeavouros.omp.json-root.png?raw=true)

- **Unwritable Directory**

    > ![endeavouros-unwrite](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-endeavouros.omp.json-unwrite.png?raw=true)

- **Python**

  - **Script**

        > ![endeavouros-script](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-endeavouros.omp.json-script.png?raw=true)

  - **Venv**

        > ![endeavouros-venv](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-endeavouros.omp.json-venv.png?raw=true)

</details>

---

## Distros

> If you want a distro added, create an ***enhancement*** issue.
> You may just say the name, or create a whole config part.
> You can find the ***Example*** config in the Documentation section.

---

## Documentation

- [**Bash Scripts**](#bash-scripts)
- [**Python Scripts**](#python-scripts)
- [**Config**](#config)

### Bash Scripts

#### generate-all.sh

- Generate themes from config, generate previews and generate markdown
- Runs `distrous.sh`, `gen-previews.sh`, `gen-readme.sh` in that order

#### distrous.sh

- Runs `python/distrous.py`

#### gen-previews.sh

- Generates all previews
  - **Basic** - in GitHub Repo Directory
  - ***General*** - `cd ..` from the Repo
  - ***Root*** - `sudo -s <command>` in `cd ..`
  - *Unwritable* - `cd ./env/unwritable_dir/`, which is a root owned directory
  - *Python Script* - `cd ./python/`,in the scripts directory
  - *Python Venv* - `source ./env/python_venv/bin/activate`, to show a general venv

#### gen-readme.sh

- Runs `python/gen-readme.py`

#### git-push.sh "$@"

- Adds all, Commits with a message in an argument, Pushes to Repo in one command
- To make it faster

### Python Scripts

#### python/distrous.py

- Loads config into a dictionary
- Generates themes from a template

#### python/gen-readme.py

- Loads a config for the names
- Has a template string for the previews
- Uses `templates/template-PREVIEWS.md` to generate `PREVIEWS.md`

### Config

```json
"EndeavourOS": {                # Theme Name
  "icon": "\uF322 EOS",         # NerdFont UTF and/or Inicials
  "prompt_arr": "#D6BEEB",      # Arrow leading from time to prompt
  "distro_bg": "#7735B9",       # Main Distro color
  "distro_fg": "#FFFFFF",       # Text Color to complement distro_bg
  "shell_bg": "#6C6CF5",        # Secondary distro color
  "shell_fg": "#FFFFFF",        # Text Color to complement shell_bg
  "root_bg": "#F46C6B",         # Tertiary distro color 
  "root_fg": "#000000",         # Text Color to complement root_bg
  "pipe": "#79DFE1",            # Pipe/Divider Color
  "time": "#D6BEEB",            # Time Color 
  "date": "#F2D3B6",            # Date Color 
  "user": "#C771FF",            # Username Color
  "host": "#FAFFA7",            # Hostname Color 
  "writable_dir": "#2DFF9B",    # User-owned Dir tree color
  "unwritable_dir": "#FF4444",  # Non-User-owned Dir tree color
  "generate": true              # If true, theme generates when running scripts; if false, theme is skipped
}
```

> Secondary and Tertiary colors do not need to be from distro.
> They can be created by you based on the distro color/s
