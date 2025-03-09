import json as js
import os.path as op


def main():
    file_dir = op.dirname(op.dirname(op.expanduser(__file__)))

    with open(op.join(file_dir, "config.json")) as j:
        cfg = list(js.load(j).keys())

    template = """
### %name

> [![%s_name-preview](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-%s_name.omp.json.png?raw=true)](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/themes/distrous-%s_name.omp.json?raw=true)

<details>
    <summary>General</summary>
    
> ![%s_name-general](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-%s_name.omp.json-general.png?raw=true)

</details>

<details>
    <summary>Root</summary>
    
> ![%s_name-root](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-%s_name.omp.json-root.png?raw=true)

</details>


<details>
    <summary>Unwritable Directory</summary>

> ![%s_name-unwrite](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-%s_name.omp.json-unwrite.png?raw=true)

</details>

<details>
    <summary>Python</summary>

    <details>
        <summary>Script</summary>

> ![%s_name-script](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-%s_name.omp.json-script.png?raw=true)

    </details>

    <details>
        <summary>Venv</summary>

> ![%s_name-venv](https://github.com/TheElevatedOne/distrous.omp.json/blob/main/previews/distrous-%s_name.omp.json-venv.png?raw=true)

    </details>

</details>

    """

    previews_md = ""
    for name in cfg:
        previews_md += template.replace("%name", name).replace(
            "%s_name", name.lower().replace(" ", "-")
        )

    readme = open(op.join(file_dir, "README.md"), "w")
    t_readme = open(
        op.join(file_dir, "templates", "template-README.md"), "r"
    ).readlines()

    for line in t_readme:
        readme.write(line.replace("%template\n", previews_md))

    readme.close()


if __name__ == "__main__":
    main()
