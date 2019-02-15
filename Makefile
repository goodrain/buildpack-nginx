all: build pkg rm 
build:
	@docker build -t local/build .

pkg:
	@docker run -it --rm -v $(PWD)/package:/opt/package local/build

rm:
	@docker rmi local/build