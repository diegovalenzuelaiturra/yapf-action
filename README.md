# YAPF Code Formatter GitHub Action

A GitHub action that runs [YAPF code formatter](https://github.com/google/yapf) for Python.

It will automatically commit the changes!

## Example Workflow

On your repo, create a folder called `.github/workflows/` containing a `main.yml` file, with the following workflow configurations :

```yaml
name: YAPF Formatter

# the workflow is triggered on pushes and applied to python files
on:
  push:
    paths:
      - "**.py"

jobs:
  build:
    name: YAPF Formatter
    # the workflow runs on ubuntu
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
      - name: YAPF Formatter
        # This step uses diegovalenzuelaiturra's yapf-action:
        #   https://github.com/diegovalenzuelaiturra/yapf-action
        uses: diegovalenzuelaiturra/yapf-action@master
        with:
          args: . --verbose --recursive --in-place
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

      - name: Commit files
        run: |
          echo ${{ github.ref }}
          git add .
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git commit -m "Automated Formatter Push" -a | exit 0

      - name: Push changes
        if: github.ref == 'refs/heads/master'
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

If you want to edit the message it will automatically commit to your repository when pushing the changes, edit the following command of the worflow to include your own custom message:

```bash
git commit -m "Automated Formatter Push" -a | exit 0
```

For a full list of possible args checkout the [YAPF docs](https://github.com/google/yapf#Usage).
