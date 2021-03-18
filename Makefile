NAME=dredd
SRC=github.com
TAG=asccigcc/dredd

# Build the development Docker file
docker-build:
	docker build --tag=$(TAG) --build-arg GITHUB_ACCESS_TOKEN .

# Start a development shell
shell:
	docker run --rm \
		--name=$(NAME) \
		-P=true \
		-v $(realpath .):/go/src/$(SRC)/$(TAG) \
		-w /go/src/$(SRC)/$(TAG) \
		-v ~/.vim:/root/.vim \
		-v ~/.vimrc:/root/.vimrc \
		-it $(TAG) /bin/zsh

test:
	docker run --rm \
		--name=$(NAME) \
		-v $(realpath .):/go/src/$(SRC)/$(TAG) \
		-w /go/src/$(SRC)/$(TAG) \
		-it $(TAG) go test

