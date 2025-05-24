from pathlib import Path
from subprocess import check_output, run, DEVNULL
import json

# pyright: basic

STATE_FILE = Path.home() / ".tmux_state.json"


def recreate(js: dict) -> None:
    for session_name, windows in js["sessions"].items():
        for window_index, pane_path in windows.items():
            if tmux_has_session(session_name):
                tmux_new_window(session_name)
            else:
                tmux_new_session(session_name)

            tmux_cd(session_name, window_index, pane_path)
        tmux_goto_window(1)


def tmux_has_session(name: str) -> bool:
    res = run(
        ["tmux", "has-session", "-t", name],
        stderr=DEVNULL,
        stdout=DEVNULL,
        check=False,
    )
    return res.returncode == 0


def tmux_new_window(session_name: str) -> None:
    _ = check_output(["tmux", "new-window", "-t", session_name])


def tmux_new_session(name: str) -> None:
    _ = check_output(["tmux", "new-session", "-d", "-s", name])


def tmux_cd(session_name: str, window_index: str, pane_path: str) -> None:
    _ = check_output(
        [
            "tmux",
            "send-keys",
            "-t",
            f"{session_name}:{window_index}",
            "cd ",
            pane_path,
            "C-m",
        ]
    )
    _ = check_output(
        [
            "tmux",
            "send-keys",
            "-t",
            f"{session_name}:{window_index}",
            "clear",
            "C-m",
        ]
    )


def tmux_goto_window(index: int) -> None:
    _ = check_output(["tmux", "select-window", "-t", str(index)])


if __name__ == "__main__":
    with open(STATE_FILE, "r", encoding="utf-8") as f:
        loaded = json.load(f)

    recreate(loaded)
