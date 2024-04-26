**Requires pipx**

Install system-wide `poetry` (see `pipx.lock`):

`pipx install poetry`
`poetry config virtualenvs.create false`

Create a new `venv`:
`python3.11 -m venv .venv`

Then install w/e:
`poetry add jupyter matplotlib pandas numpy scipy scikit-learn torch torchvision tqdm hydra-core`

Example [pyproject.toml](https://gist.github.com/sebszyller/6e78999e3466a07d307e54e11ef0b9aa)
