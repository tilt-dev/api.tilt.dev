.PHONY: gendocs dump-api base update-base

gendocs:
	rm -fR docs/core
	rm -fR docs/interface
	rm -fR docs/kubernetes
	rm -fR docs/container-images
	rm -fR docs/docker-compose
	rm -fR docs/meta
	rm -fR docs/other-resources
	rm -fR docs/common-parameters
	mkdir -p docs
	go run ./cmd/gendocs -f openapi-spec/swagger.json kwebsite --config-dir=config --output-dir=docs --templates=./templates
	find docs -name "*.md" | xargs sed -i.bak 's|<a href="... ref "\([^"]*\)" ...">\([^<]*\)</a>|[\2](\1)|g'
	find docs -name "*.md" | xargs sed -i.bak 's|^api_metadata|layout: api\napi_metadata|g'
	find docs -name "*.md" | xargs sed -i.bak "s/\([^\]\)[|]/\1\\\|/g"
	find docs -name "*.md.bak" -delete

dump-api:
	tilt dump openapi > openapi-spec/swagger.json

base:
	git submodule init
	git submodule update

update-base:
	cd ./base && git fetch && git merge --ff-only origin/master

build-docs:
	rm -fR build/docs
	docker build -t api-site-base -f deploy/base.dockerfile .
	docker buildx build --target static --output type=local,dest=build/docs -f deploy/Dockerfile .
