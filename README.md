# Simple Python Docker cron
Simple Docker Ubuntu cron-tab setup with Python script.

## Getting started

#### setup project
- Click 'Use this Template'
- checkout your new project: `git clone git@github.com:<your-github-name>/<created-project-name>.git`
- jump into folder and run: `make init`
  - creates the default .env file (only if it doesnt exists already)
  - creates a fresh python virtual environment

#### start coding
- put your (existing) python code into `src/`. 
    - important: your main file should be named: `main.py`
- you can run your code with `make` or `make python-run`
- if you want to add new pypi dependencies:
  - put your pypi dependencies into requirements.txt
  - run `make python-install` to setup a new python virtual environment

#### build & run the container with docker
- in file `python-cron` configure cron schedule by replacing the * symbols (for help: [crontab schedule builder](https://crontab.guru/#*_*_*_*_*))
- running `make container` will build the cron-tab-docker-container and starting it with docker-compose
- if you want to build and run independently use: 
  - `make container-build` to build the container
  - `make container-run` to run the container
  - `make container-run-detached` to run the container in the background
    
#### envrionment variables
- you can add environment variables to env/.env
- all variables will be visible:
  -  in docker-compose.yml 
  -  in your apps execution environment (local and contnainer)


#### Contribution
- inital idea from https://stackoverflow.com/a/37458519/7423160
