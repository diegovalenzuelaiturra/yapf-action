# YAPF Code Formatter GitHub Action

A [GitHub action](https://github.com/diegovalenzuelaiturra/yapf-action) that runs [YAPF code formatter](https://github.com/google/yapf) for Python.

It will automatically commit the changes!

An example workflow can be found at `.github/workflows/yapf.yml`

## Example Workflow

On your repo, create a folder called `.github/workflows/` containing a `yapf.yml` file, with the following workflow configurations :

```yaml
name: YAPF Formatter

on:
  push:
    paths:
      - "**.py"

jobs:
  build:
    name: YAPF Formatter
    runs-on: ubuntu-latest

    steps:
      - name: checkout repo
        uses: actions/checkout@v2.3.4
        with:
          repository: ${{ github.repository }}
          token: ${{ github.token }}

      # https://github.com/diegovalenzuelaiturra/yapf-action
      - name: YAPF Formatter
        uses: diegovalenzuelaiturra/yapf-action@master
        with:
          args: . --verbose --recursive --in-place --parallel

      - name: action metadata
        run: |
          echo -e "action     : ${{ github.action }}"
          echo -e "actor      : ${{ github.actor }}"
          echo -e "event_name : ${{ github.event_name }}"
          echo -e "job        : ${{ github.job }}"
          echo -e "ref        : ${{ github.ref }}"
          echo -e "repository : ${{ github.repository }}"
          echo -e "run_id     : ${{ github.run_id }}"
          echo -e "sha        : ${{ github.sha }}"
          echo -e "workflow   : ${{ github.workflow }}"
          echo -e "workspace  : ${{ github.workspace }}"

      - name: config github
        run: |
          git config user.name github-actions
          git config user.email github-actions@github.com

      - name: add changes
        run: |
          git add .

      - name: commit changes
        run: |
          git commit -m "Automation: YAPF Formatter" --all | exit 0

      # NOTE : only push changes when the source branch is being pushed to master (target branch)
      - name: push changes
        if: github.ref == 'refs/heads/master'
        run: |
          git push
```

If you want to edit the message it will automatically commit to your repository when pushing the changes, edit the following command of the worflow to include your own custom message:

```bash
git commit -m "Automation: YAPF Formatter" --all | exit 0
```

For a full list of possible args checkout the [YAPF docs](https://github.com/google/yapf#Usage).
