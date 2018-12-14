.PHONY: all
IMAGE_URL=wangxinsh/timestamp-nginx
TAG_LATEST=latest
TAG_CURRENT=$(shell date +%Y%m%d-%H%M%S)


build:
	@echo ${TAG_CURRENT}
	docker build -t $(IMAGE_URL):$(TAG_LATEST) src/ -f docker/Dockerfile
	docker tag ${IMAGE_URL}:$(TAG_LATEST) $(IMAGE_URL):$(TAG_CURRENT)
	docker push $(IMAGE_URL):$(TAG_LATEST)
	docker push $(IMAGE_URL):$(TAG_CURRENT)

install:
	kubectl run ts-nginx --image=wangxinsh/timestamp-nginx:latest
	kubectl expose deploy ts-nginx --type=NodePort --port=80 --target-port=80

uninstall:
	kubectl delete deploy ts-nginx
	kubectl delete svc ts-nginx
