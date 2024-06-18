# My Custom GitHub Actions
![Build](https://github.com/mcritic/m-actions/actions/workflows/test-js-action.yml/badge.svg)

[![Docker Action Example](https://github.com/mcritic/m-actions/actions/workflows/test-docker-action.yml/badge.svg)](https://github.com/mcritic/m-actions/actions/workflows/test-docker-action.yml)


## Description

**My Custom GitHub Actions** consist of multiple actions: one in JS and another in Docker. They greet a user and return the current time, demonstrating how to build and use custom GitHub Actions.

## Usage

### JS Example Usage

Create a workflow file in your repository, for example, `.github/workflows/use-external-js-action.yml`, and add the following code:

```yaml
name: JS Action Example

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  example:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v3

    - name: Use Custom Action from External Repo
      id: custom-action
      uses: mcritic/m-actions/.github/actions/js-action@v1.1.0
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
![image](https://github.com/mcritic/m-actions/assets/11994240/6f0a0ca6-0ef2-40df-847f-7e4587d827a0)


### Docker Example Usage

Create a workflow file in your repository, for example, `.github/workflows/use-external-docker-action.yml`, and add the following code:

```yaml
name: Docker Action Example

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v2

      - name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1

      - name: Run Docker action
        id: docker-action
        uses: mcritic/m-actions/.github/actions/docker-action@v1.1.0
        with:
          who-to-greet: 'GitHub User'

      - name: Get the output from Docker action
        run: echo "Hello, ${{ steps.docker-action.outputs.who-to-greet }}! The time from Docker action was ${{ steps.docker-action.outputs.time }}"
```

# Inputs
**who-to-greet**: The name of the person to greet. Default: World.
# Outputs
**time**: The current time.
# Result
![image](https://github.com/mcritic/m-actions/assets/11994240/ba95730a-fdc5-4bc2-998e-bf3577151879)



# License
This project is licensed under the [MIT License](https://github.com/mcritic/m-actions/blob/main/LICENSE).
