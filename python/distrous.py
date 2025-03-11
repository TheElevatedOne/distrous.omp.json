import json as js
import os.path as op


def main() -> None:
    file_dir = op.dirname(op.dirname(op.expanduser(__file__)))
    config = op.join(file_dir, "config.json")

    with open(config) as r:
        cfg_dict = js.load(r)

    for key, val in cfg_dict.items():
        if not val["generate"]:
            continue

        result = open(
            op.join(
                file_dir,
                "themes",
                f"distrous-{key.lower().replace(' ', '-').replace('!', '').replace('?', '')}.omp.json",
            ),
            "w",
        )
        with open(op.join(file_dir, "templates", "template.omp.json"), "r") as file:
            for line in file.readlines():
                result.write(
                    line.replace("%icon", val["icon"])
                    .replace("%prompt_arr", val["prompt_arr"])
                    .replace("%distro_bg", val["distro_bg"])
                    .replace("%distro_fg", val["distro_fg"])
                    .replace("%shell_bg", val["shell_bg"])
                    .replace("%shell_fg", val["shell_fg"])
                    .replace("%root_bg", val["root_bg"])
                    .replace("%root_fg", val["root_fg"])
                    .replace("%pipe", val["pipe"])
                    .replace("%time", val["time"])
                    .replace("%date", val["date"])
                    .replace("%user", val["user"])
                    .replace("%host", val["host"])
                    .replace("%writable_dir", val["writable_dir"])
                    .replace("%unwritable_dir", val["unwritable_dir"])
                )


if __name__ == "__main__":
    main()
