clean:
	go clean

build:
	go build -v

build-release:
	bash .tools/build.sh

build-image:
	bash .tools/build_image.sh

deploy:
	bash .tools/deploy.sh