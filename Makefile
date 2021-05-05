new: build run

build:
	docker build --progress=plain -t funkykay/cron-example .

run:
	docker-compose --file deploy/docker-compose.yaml up

clean:
	docker-compose --file deploy/docker-compose.yaml rm
