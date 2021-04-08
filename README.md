# api.tilt.dev

Reference docs for the Tilt API

## What

The future of Tilt is a simple model consisting of very few types of building
blocks, and a mix of uniformity and versatility whereby using the same simple
elements one can build complex systems and different types of functionality.

The [Tilt apiserver](https://github.com/tilt-dev/tilt-apiserver) is the base
layer of that model.

This repository generates the API that the current Tilt server supports.

## openapi-spec

The Tilt API server generates openapi-spec/swagger.json, a complete specification
of Tilt's API objects.

The Kubernetes project automates this generation with this Bash script:

https://github.com/kubernetes/kubernetes/blob/master/hack/update-openapi-spec.sh

Currently we generate this by manually following the steps in that script
(tweaking them for the Tilt API server).

