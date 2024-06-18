# My Custom GitHub Action

![Build](https://github.com/mcritic/m-actions/actions/workflows/test-js-action.yml/badge.svg)

## Description

**My Custom GitHub Action** is a simple GitHub Action that greets a user and returns the current time. This Action was created to demonstrate how to build and use custom GitHub Actions.

## Usage

### Example Usage

Create a workflow file in your repository, for example, `.github/workflows/use-external-js-action.yml`, and add the following code:

```yaml
name: Use External Custom Action

on:
  push:
    branches:
      - main

jobs:
  example:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Use Custom Action from External Repo
      id: custom-action
      uses: mcritic/m-actions/.github/actions/js-action@v1.0.0
      with:
        who-to-greet: 'External GitHub User'

    - name: Print the Time
      run: echo "The current time is ${{ steps.custom-action.outputs.time }}"
```

# Inputs
**who-to-greet**: The name of the person to greet. Default: World.
# Outputs
**time**: The current time.
# Result
![image](https://github.com/mcritic/m-actions/assets/11994240/c4a5d190-04ad-4d56-a669-06cb7afffb1f)


# License
This project is licensed under the [MIT License](https://github.com/mcritic/m-actions/blob/main/LICENSE).
