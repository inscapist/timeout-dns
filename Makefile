assets: reset-assets
	kubectl run -i --tty timeout-dns-assets --image=sagittaros/timeout-dns:v1 --command -- ruby main.rb 5000 cf

goog: reset-goog
	kubectl run -i --tty timeout-dns-goog --image=sagittaros/timeout-dns:v1 --command -- ruby main.rb 5000 goog

reset-assets:
	kubectl delete --ignore-not-found=true pod timeout-dns-assets

reset-goog:
	kubectl delete --ignore-not-found=true pod timeout-dns-goog

build-image:
	docker build -t sagittaros/timeout-dns:v1 .
	docker push sagittaros/timeout-dns:v1
