---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "FileWatch"
content_type: "api_reference"
description: "FileWatch."
title: "FileWatch v1alpha1"
weight: 2
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## FileWatch {#FileWatch}

FileWatch

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: FileWatch


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([FileWatchSpec](../core/file-watch-v1alpha1#FileWatchSpec))


- **status** ([FileWatchStatus](../core/file-watch-v1alpha1#FileWatchStatus))






## FileWatchSpec {#FileWatchSpec}

FileWatchSpec defines the desired state of FileWatch

<hr>

- **watchedPaths** ([]string), required

  WatchedPaths are paths of directories or files to watch for changes to. It cannot be empty.

- **ignores** ([]IgnoreDef)

  Ignores are optional rules to filter out a subset of changes matched by WatchedPaths.

  <a name="IgnoreDef"></a>
  **

  - **ignores.basePath** (string), required

    BasePath is the base path for the patterns. It cannot be empty.
    
    If no patterns are specified, everything under it will be recursively ignored.

  - **ignores.patterns** ([]string)

    Patterns are dockerignore style rules. Absolute-style patterns will be rooted to the BasePath.
    
    See https://docs.docker.com/engine/reference/builder/#dockerignore-file.





## FileWatchStatus {#FileWatchStatus}

FileWatchStatus defines the observed state of FileWatch

<hr>

- **error** (string)

  Error is set if there is a problem with the filesystem watch. If non-empty, consumers should assume that no filesystem events will be seen and that the file watcher is in a failed state.

- **fileEvents** ([]FileEvent)

  FileEvents summarizes batches of file changes (create, modify, or delete) that have been seen in ascending chronological order. Only the most recent 20 events are included.

  <a name="FileEvent"></a>
  **

  - **fileEvents.seenFiles** ([]string), required

    SeenFiles is a list of paths which changed (create, modify, or delete).

  - **fileEvents.time** (MicroTime), required

    Time is an approximate timestamp for a batch of file changes.
    
    This will NOT exactly match any inode attributes (e.g. ctime, mtime) at the filesystem level and is purely informational or for use as an opaque watermark.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **lastEventTime** (MicroTime)

  LastEventTime is the timestamp of the most recent file event. It is zero if no events have been seen yet.
  
  If the specifics of which files changed are not important, this field can be used as a watermark without needing to inspect FileEvents.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **monitorStartTime** (MicroTime)

  MonitorStartTime is the timestamp of when filesystem monitor was started. It is zero if the monitor has not been started yet.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*





## FileWatchList {#FileWatchList}

FileWatchList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: FileWatchList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][FileWatch](../core/file-watch-v1alpha1#FileWatch)), required






## Operations {#Operations}



<hr>






### `get` read the specified FileWatch

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/filewatches/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the FileWatch


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): OK


### `get` read status of the specified FileWatch

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/filewatches/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the FileWatch


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): OK


### `list` list or watch objects of kind FileWatch

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/filewatches

#### Parameters


- **allowWatchBookmarks** (*in query*): boolean

  allowWatchBookmarks requests watch events with type "BOOKMARK". Servers that do not implement bookmarks may ignore this flag and bookmarks are sent at the server's discretion. Clients should not assume bookmarks are returned at any specific interval, nor may they assume the server will send any BOOKMARK event during a session. If this is not a watch, this field is ignored. If the feature gate WatchBookmarks is not enabled in apiserver, this field is ignored.


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

  Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.



#### Response


200 ([FileWatchList](../core/file-watch-v1alpha1#FileWatchList)): OK


### `create` create a FileWatch

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/filewatches

#### Parameters


- **body**: [FileWatch](../core/file-watch-v1alpha1#FileWatch), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): OK

201 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): Created

202 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): Accepted


### `update` replace the specified FileWatch

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/filewatches/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the FileWatch


- **body**: [FileWatch](../core/file-watch-v1alpha1#FileWatch), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): OK

201 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): Created


### `update` replace status of the specified FileWatch

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/filewatches/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the FileWatch


- **body**: [FileWatch](../core/file-watch-v1alpha1#FileWatch), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): OK

201 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): Created


### `patch` partially update the specified FileWatch

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/filewatches/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the FileWatch


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


200 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): OK


### `patch` partially update status of the specified FileWatch

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/filewatches/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the FileWatch


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


200 ([FileWatch](../core/file-watch-v1alpha1#FileWatch)): OK


### `delete` delete a FileWatch

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/filewatches/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the FileWatch


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


### `deletecollection` delete collection of FileWatch

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/filewatches

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

