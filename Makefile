manual-push:
	docker build -t quay.io/pngmbh/quantum-grafana:next -f Dockerfile .
	docker push quay.io/pngmbh/quantum-grafana:next
