import json as js
import os.path as op


def main():
    file_dir = op.dirname(op.dirname(op.expanduser(__file__)))

    with open(op.join(file_dir, "config.json")) as j:
        cfg = js.load(j)

    template = """
### %name

> ![%s_name-preview](previews/distrous-%s_name.omp.json.png)

**Link to file:** [distrous-%s_name.omp.json](themes/distrous-%s_name.omp.json)

<details>
    <summary>Extra</summary>

- **General**
        
    > ![%s_name-general](previews/distrous-%s_name.omp.json-general.png)

- **Root**

    > ![%s_name-root](previews/distrous-%s_name.omp.json-root.png)

- **Unwritable Directory**

    > ![%s_name-unwrite](previews/distrous-%s_name.omp.json-unwrite.png)

- **Python**

    - **Script**

        > ![%s_name-script](previews/distrous-%s_name.omp.json-script.png)

    - **Venv**

        > ![%s_name-venv](previews/distrous-%s_name.omp.json-venv.png)

</details>

    """

    previews_md = ""
    for name, item in cfg.items():
        if not item["generate"]:
            continue

        previews_md += template.replace("%name", name).replace(
            "%s_name", name.lower().replace(" ", "-").replace("!", "").replace("?", "")
        )

    readme = open(op.join(file_dir, "PREVIEWS.md"), "w")
    t_readme = open(
        op.join(file_dir, "templates", "template-PREVIEWS.md"), "r"
    ).readlines()

    for line in t_readme:
        readme.write(line.replace("%template\n", previews_md))

    readme.close()


if __name__ == "__main__":
    main()
