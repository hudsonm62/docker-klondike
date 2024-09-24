image:
	docker build -t klondike .

build:
	make image

pretty:
	prettier . --w
