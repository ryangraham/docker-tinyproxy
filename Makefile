all:  build

build:
	docker build -t ryangraham/tinyproxy .

run:
	docker run --name tinyproxy -p 8888:8888 -d ryangraham/tinyproxy

rm:
	docker stop tinyproxy && docker rm tinyproxy
