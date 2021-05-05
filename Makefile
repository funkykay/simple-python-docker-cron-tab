ENV_FILE_PATH=env/.env
-include $(ENV_FILE_PATH)

#######
# GENERAL
##

default: python-run
init: environment-init python-init
clean: python-clean container-clean


#######
# ENVIRONMENT
##

environment-init:
	-cp -n env/example.env env/.env


#######
# PYTHON
##

python-run:	
	set -o allexport; source $(ENV_FILE_PATH); set +o allexport; venv/bin/python src/main.py
	
python-init: python-clean python-venv python-install

python-clean:
	rm -rf venv/

python-venv:
	python3 -m venv venv

python-install:
	venv/bin/python -m pip install -r requirements.txt


#######
# CONTAINER
##

container: container-build container-run

container-build:
	docker build --progress=plain -t $(GITHUB_USERNAME)/$(APP_NAME) .

container-run:
	ENV_FILE_PATH=$(ENV_FILE_PATH) docker-compose --env-file $(ENV_FILE_PATH) up

container-run-detached:
	ENV_FILE_PATH=$(ENV_FILE_PATH) docker-compose --env-file $(ENV_FILE_PATH) up -d

container-clean:
	ENV_FILE_PATH=$(ENV_FILE_PATH) docker-compose --env-file $(ENV_FILE_PATH) rm -f
