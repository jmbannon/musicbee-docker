src:
	docker build --no-cache -t musicbee-docker-src:local src/
	docker run \
		--name=musicbee-docker-src \
		-e PUID=1000 \
		-e PGID=1000 \
		-e TZ=America/Los_Angeles \
		-v `pwd`/src/config:/config \
		-p 3002:3000 \
		--security-opt="seccomp=unconfined" \
		--shm-size "1gb" \
		musicbee-docker-src:local
docker:
	docker build --no-cache -t musicbee-docker:local .

.PHONY: src docker
