---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "Extension"
content_type: "api_reference"
description: "Extension defines an extension that's evaluated on Tilt startup."
title: "Extension v1alpha1"
weight: 5
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## Extension {#Extension}

Extension defines an extension that's evaluated on Tilt startup.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: Extension


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([ExtensionSpec](../core/extension-v1alpha1#ExtensionSpec))


- **status** ([ExtensionStatus](../core/extension-v1alpha1#ExtensionStatus))






## ExtensionSpec {#ExtensionSpec}

ExtensionSpec defines the desired state of Extension

<hr>

- **repoName** (string), required

  RepoName specifies the ExtensionRepo object where we should find this extension.
  
  The Extension controller should watch for changes to this repo, and may update if this repo is deleted or moved.

- **repoPath** (string), required

  RepoPath specifies the path to the extension directory inside the repo.
  
  Once the repo is downloaded, this path should point to a directory with a Tiltfile as the main "entrypoint" of the extension.

- **args** ([]string)

  Arguments to the Tiltfile loaded by this extension.
  
  Arguments can be positional (['a', 'b', 'c']) or flag-based ('--to-edit=a'). By default, a list of arguments indicates the list of services in the tiltfile that should be enabled.





## ExtensionStatus {#ExtensionStatus}

ExtensionStatus defines the observed state of Extension

<hr>

- **error** (string)

  Contains information about any problems loading the extension.

- **path** (string)

  The path to the extension on disk. This location should be shared and readable by all Tilt instances.





## ExtensionList {#ExtensionList}

ExtensionList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ExtensionList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][Extension](../core/extension-v1alpha1#Extension)), required






## Operations {#Operations}



<hr>






### `get` read the specified Extension

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/extensions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Extension


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Extension](../core/extension-v1alpha1#Extension)): OK


### `get` read status of the specified Extension

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/extensions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Extension


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Extension](../core/extension-v1alpha1#Extension)): OK


### `list` list or watch objects of kind Extension

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/extensions

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


200 ([ExtensionList](../core/extension-v1alpha1#ExtensionList)): OK


### `create` create an Extension

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/extensions

#### Parameters


- **body**: [Extension](../core/extension-v1alpha1#Extension), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Extension](../core/extension-v1alpha1#Extension)): OK

201 ([Extension](../core/extension-v1alpha1#Extension)): Created

202 ([Extension](../core/extension-v1alpha1#Extension)): Accepted


### `update` replace the specified Extension

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/extensions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Extension


- **body**: [Extension](../core/extension-v1alpha1#Extension), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Extension](../core/extension-v1alpha1#Extension)): OK

201 ([Extension](../core/extension-v1alpha1#Extension)): Created


### `update` replace status of the specified Extension

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/extensions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Extension


- **body**: [Extension](../core/extension-v1alpha1#Extension), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Extension](../core/extension-v1alpha1#Extension)): OK

201 ([Extension](../core/extension-v1alpha1#Extension)): Created


### `patch` partially update the specified Extension

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/extensions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Extension


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


200 ([Extension](../core/extension-v1alpha1#Extension)): OK

201 ([Extension](../core/extension-v1alpha1#Extension)): Created


### `patch` partially update status of the specified Extension

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/extensions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Extension


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


200 ([Extension](../core/extension-v1alpha1#Extension)): OK

201 ([Extension](../core/extension-v1alpha1#Extension)): Created


### `delete` delete an Extension

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/extensions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Extension


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


### `deletecollection` delete collection of Extension

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/extensions

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

