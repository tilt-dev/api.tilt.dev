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






## Operations {#Operations}



<hr>






### `get` read the specified ConfigMap

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/configmaps/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ConfigMap


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ConfigMap](../core/config-map-v1alpha1#ConfigMap)): OK


### `list` list or watch objects of kind ConfigMap

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/configmaps

#### Parameters


- **allowWatchBookmarks** (*in query*): boolean

  [allowWatchBookmarks](../common-parameters/common-parameters#allowWatchBookmarks)


- **continue** (*in query*): string

  [continue](../common-parameters/common-parameters#continue)


- **fieldSelector** (*in query*): string

  [fieldSelector](../common-parameters/common-parameters#fieldSelector)


- **labelSelector** (*in query*): string

  [labelSelector](../common-parameters/common-parameters#labelSelector)


- **limit** (*in query*): integer

  [limit](../common-parameters/common-parameters#limit)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)


- **resourceVersion** (*in query*): string

  [resourceVersion](../common-parameters/common-parameters#resourceVersion)


- **resourceVersionMatch** (*in query*): string

  [resourceVersionMatch](../common-parameters/common-parameters#resourceVersionMatch)


- **timeoutSeconds** (*in query*): integer

  [timeoutSeconds](../common-parameters/common-parameters#timeoutSeconds)


- **watch** (*in query*): boolean

  [watch](../common-parameters/common-parameters#watch)



#### Response


200 ([ConfigMapList](../core/config-map-v1alpha1#ConfigMapList)): OK


### `create` create a ConfigMap

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/configmaps

#### Parameters


- **body**: [ConfigMap](../core/config-map-v1alpha1#ConfigMap), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ConfigMap](../core/config-map-v1alpha1#ConfigMap)): OK

201 ([ConfigMap](../core/config-map-v1alpha1#ConfigMap)): Created

202 ([ConfigMap](../core/config-map-v1alpha1#ConfigMap)): Accepted


### `update` replace the specified ConfigMap

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/configmaps/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ConfigMap


- **body**: [ConfigMap](../core/config-map-v1alpha1#ConfigMap), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ConfigMap](../core/config-map-v1alpha1#ConfigMap)): OK

201 ([ConfigMap](../core/config-map-v1alpha1#ConfigMap)): Created


### `patch` partially update the specified ConfigMap

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/configmaps/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ConfigMap


- **body**: [Patch](../meta/patch#Patch), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **force** (*in query*): boolean

  [force](../common-parameters/common-parameters#force)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ConfigMap](../core/config-map-v1alpha1#ConfigMap)): OK


### `delete` delete a ConfigMap

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/configmaps/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ConfigMap


- **body**: [DeleteOptions](../meta/delete-options#DeleteOptions)

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **gracePeriodSeconds** (*in query*): integer

  [gracePeriodSeconds](../common-parameters/common-parameters#gracePeriodSeconds)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)


- **propagationPolicy** (*in query*): string

  [propagationPolicy](../common-parameters/common-parameters#propagationPolicy)



#### Response


200 ([Status](../meta/status#Status)): OK

202 ([Status](../meta/status#Status)): Accepted


### `deletecollection` delete collection of ConfigMap

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/configmaps

#### Parameters


- **body**: [DeleteOptions](../meta/delete-options#DeleteOptions)

  


- **continue** (*in query*): string

  [continue](../common-parameters/common-parameters#continue)


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldSelector** (*in query*): string

  [fieldSelector](../common-parameters/common-parameters#fieldSelector)


- **gracePeriodSeconds** (*in query*): integer

  [gracePeriodSeconds](../common-parameters/common-parameters#gracePeriodSeconds)


- **labelSelector** (*in query*): string

  [labelSelector](../common-parameters/common-parameters#labelSelector)


- **limit** (*in query*): integer

  [limit](../common-parameters/common-parameters#limit)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)


- **propagationPolicy** (*in query*): string

  [propagationPolicy](../common-parameters/common-parameters#propagationPolicy)


- **resourceVersion** (*in query*): string

  [resourceVersion](../common-parameters/common-parameters#resourceVersion)


- **resourceVersionMatch** (*in query*): string

  [resourceVersionMatch](../common-parameters/common-parameters#resourceVersionMatch)


- **timeoutSeconds** (*in query*): integer

  [timeoutSeconds](../common-parameters/common-parameters#timeoutSeconds)



#### Response


200 ([Status](../meta/status#Status)): OK

