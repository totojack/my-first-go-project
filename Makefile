DOCKER_REPO = lucaiovio/myfirstgoproject

build:
	docker build -t ${DOCKER_REPO}:latest .

push:
	docker push ${DOCKER_REPO}:latest

buildtest:
	docker-compose -f docker-compose.test.yml build sut

runtest:
	docker-compose -f docker-compose.test.yml run --rm sut