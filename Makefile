image:
	docker build -t grpcui -f Dockerfile .

run-service: image
	docker run \
		-e GRPCUI_SERVER=172.17.0.3:6000 \
		-p 8080:8080 \
		--mount type=bind,source="$(PROTOSET)",target=/protoset/service.protoset \
		grpcui