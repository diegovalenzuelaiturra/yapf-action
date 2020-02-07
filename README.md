# YAPF Code Formatter GitHub Action

A GitHub action that runs [YAPF code formatter](https://github.com/google/yapf) for Python.

## Example Workflow

```workflow
name: YAPF Code Formatter :)

# This workflow is triggered on pushes
on:
  
  push: 
    paths:
      - '**.py'
      
jobs:
  build:
    
    # Job name is "yapf formatter"
    name: "YAPF Formatter"
    
    # This job runs on Linux
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v2
    - name: "Formatter Action"
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
  
  For a full list of possible args checkout the [YAPF docs](https://github.com/google/yapf#Usage).
