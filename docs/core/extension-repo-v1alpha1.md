---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "ExtensionRepo"
content_type: "api_reference"
description: "ExtensionRepo specifies a repo or folder where a set of extensions live."
title: "ExtensionRepo v1alpha1"
weight: 6
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## ExtensionRepo {#ExtensionRepo}

ExtensionRepo specifies a repo or folder where a set of extensions live.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ExtensionRepo


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([ExtensionRepoSpec](../core/extension-repo-v1alpha1#ExtensionRepoSpec))


- **status** ([ExtensionRepoStatus](../core/extension-repo-v1alpha1#ExtensionRepoStatus))






## ExtensionRepoSpec {#ExtensionRepoSpec}

ExtensionRepoSpec defines how to access the repo.

<hr>

- **url** (string), required

  The URL of the repo.
  
  Allowed: https: URLs that point to a public git repo file: URLs that point to a location on disk.

- **ref** (string)

  A reference to sync the repo to. If empty, Tilt will always update the repo to the latest version.





## ExtensionRepoStatus {#ExtensionRepoStatus}

ExtensionRepoStatus defines the observed state of ExtensionRepo

<hr>

- **checkoutRef** (string)

  The reference that we currently have checked out. On git, this is the commit hash. On file repos, this is empty.

- **error** (string)

  Contains information about any problems loading the repo.

- **lastFetchedAt** (Time)

  The last time the repo was fetched and checked for validity.

  <a name="Time"></a>
  *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

- **path** (string)

  The path to the repo on local disk.





## ExtensionRepoList {#ExtensionRepoList}

ExtensionRepoList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ExtensionRepoList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)), required






## Operations {#Operations}



<hr>






### `get` read the specified ExtensionRepo

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/extensionrepos/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ExtensionRepo


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): OK


### `get` read status of the specified ExtensionRepo

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/extensionrepos/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ExtensionRepo


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): OK


### `list` list or watch objects of kind ExtensionRepo

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/extensionrepos

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


200 ([ExtensionRepoList](../core/extension-repo-v1alpha1#ExtensionRepoList)): OK


### `create` create an ExtensionRepo

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/extensionrepos

#### Parameters


- **body**: [ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): OK

201 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): Created

202 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): Accepted


### `update` replace the specified ExtensionRepo

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/extensionrepos/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ExtensionRepo


- **body**: [ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): OK

201 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): Created


### `update` replace status of the specified ExtensionRepo

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/extensionrepos/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ExtensionRepo


- **body**: [ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): OK

201 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): Created


### `patch` partially update the specified ExtensionRepo

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/extensionrepos/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ExtensionRepo


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


200 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): OK

201 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): Created


### `patch` partially update status of the specified ExtensionRepo

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/extensionrepos/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ExtensionRepo


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


200 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): OK

201 ([ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)): Created


### `delete` delete an ExtensionRepo

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/extensionrepos/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ExtensionRepo


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


### `deletecollection` delete collection of ExtensionRepo

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/extensionrepos

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

