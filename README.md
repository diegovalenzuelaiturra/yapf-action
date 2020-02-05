# YAPF Code Formatter GitHub Action
A YAPF formatter GitHub action

A GitHub action that runs [YAPF code formatter](https://github.com/google/yapf) for Python.

## Example Workflow

```workflow
workflow "Example Workflow" {
  on = "push"
  resolves = ["Formatter"]
}

action "Formatter" {
  uses = "diegovalenzuelaiturra/black-action@master"
  args = ". --diff --in-place"
}
```

For a full list of possible `args` checkout the [YAPF docs](https://github.com/google/yapf#usage).
