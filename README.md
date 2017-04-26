# Python skeleton project

This repository can be used to bootstrap your new Python project, with
some boilerplate code for Sphinx, tests and directory structure.

## Prerequisites

* Python
* `pip`
* Required dependencies are listed in ```requirements.txt```.

For easy development a virtual environment is recommended.
To create this environment, run:
```sh
~$ ./bootstrap_dev.sh
```

## Development

Work on your project inside ```project_name``` directory. Run your code from this directory:

```sh
(virtualenv) ~/project_name$ python app.py
```

## Running tests

You can run tests (using pytest) with the following:

```sh
(virtualenv) ~/$ python -m pytest tests/
```

Make sure you import application files with full name in tests:

```python
# OS packages
# Third-party packages
import pytest
# Custom imports
from project_name.project import *
```

## Creating Sphinx documentation

Run the following command and answer Sphinx specific questions.

```sh
(virtualenv) ~/docs$ sphinx-quickstart
```

## Updating documentation

After editing source codes and documentation, you may want to update Sphinx.
Make new docs with:

```sh
(virtualenv) ~/project_name$ sphinx-build ../docs/source ../docs/build
```

## Adding new dependency

Add new Python dependencies with `pip`. Regenerate `requirements.txt` with the following:

```sh
(virtualenv) ~$ pip freeze > requirements.txt
```