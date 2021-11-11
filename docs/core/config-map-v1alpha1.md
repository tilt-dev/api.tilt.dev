---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "ConfigMap"
content_type: "api_reference"
description: "ConfigMap stores unstructured data that other controllers can read and write."
title: "ConfigMap v1alpha1"
weight: 4
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## ConfigMap {#ConfigMap}


ConfigMap stores unstructured data that other controllers can read and write.

Useful for sharing data from one system and subscribing to it from another.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ConfigMap


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **data** (map[string]string)

  Data contains the configuration data. Each key must consist of alphanumeric characters, '-', '_' or '.'.





## ConfigMapList {#ConfigMapList}


ConfigMapList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ConfigMapList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][ConfigMap](../core/config-map-v1alpha1#ConfigMap)), required









<hr>



