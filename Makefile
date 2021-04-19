.PHONY: gendocs

gendocs:
	rm -fR docs/core
	rm -fR docs/kubernetes
	rm -fR docs/meta
	rm -fR docs/other-resources
	rm -fR docs/common-parameters
	mkdir -p docs
	go run ./cmd/gendocs -f openapi-spec/swagger.json kwebsite --config-dir=config --output-dir=docs --templates=./templates
	find -name "*.md" | xargs sed -i 's|<a href="... ref "\([^"]*\)" ...">\([^<]*\)</a>|[\2](\1)|g'
	find -name "*.md" | xargs sed -i 's|^api_metadata|layout: api\napi_metadata|g'
	find -name "*.md" | xargs sed -i "s/'|'/'\\|'/g"
