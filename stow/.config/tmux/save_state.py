from dataclasses import dataclass
from json import dump as js_dump
import datetime
from pathlib import Path
from subprocess import check_output
from zoneinfo import ZoneInfo

# pyright: basic

STATE_FILE = Path.home() / ".tmux_state.json"


@dataclass
class Line:
    session_name: str
    window_index: str
    pane_path: str


def tmux_info() -> str:
    return check_output(
        [
            "tmux",
            "list-panes",
            "-a",
            "-F",
            "#{session_name}___#{window_index}___#{pane_current_path}",
        ],
        text=True,
    )


def time_str() -> str:
    helsinki_tz = ZoneInfo("Europe/Helsinki")
    utc_now = datetime.datetime.now(datetime.UTC)
    helsinki_time = utc_now.astimezone(helsinki_tz)
    return helsinki_time.strftime("%Y %b %d @ %H:%M")


def to_json(from_tmux: str, save_time: str) -> dict:
    def to_line(s: str) -> Line:
        session_name, window_index, pane_path = s.split("___")
        return Line(
            session_name=session_name,
            window_index=window_index,
            pane_path=pane_path,
        )

    lines = [to_line(line) for line in from_tmux.splitlines() if line]

    tmux_state = {}
    for line in lines:
        if line.session_name not in tmux_state:
            tmux_state[line.session_name] = {}

        if line.window_index not in tmux_state[line.session_name]:
            tmux_state[line.session_name][line.window_index] = line.pane_path
        else:
            continue

    return {
        "save_time": save_time,
        "sessions": tmux_state,
    }


if __name__ == "__main__":
    from_tmux = tmux_info()
    save_time = time_str()
    as_json = to_json(from_tmux, save_time)

    with open(STATE_FILE, "w", encoding="utf-8") as f:
        js_dump(as_json, f, indent=4, ensure_ascii=False)
