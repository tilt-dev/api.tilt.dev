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

  The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server, the server will respond with a 410 ResourceExpired error together with a continue token. If the client needs a consistent list, it must restart their list without the continue field. Otherwise, the client may send another list request with the token received with the 410 error, the server will respond with a list starting from the next key, but from the latest snapshot, which is inconsistent from the previous list results - objects that are created, modified, or deleted after the first list request will be included in the response, as long as their keys are after the "next key".
  
  This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.


- **fieldSelector** (*in query*): string

  A selector to restrict the list of returned objects by their fields. Defaults to everything.


- **labelSelector** (*in query*): string

  A selector to restrict the list of returned objects by their labels. Defaults to everything.


- **limit** (*in query*): integer

  limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
  
  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)


- **resourceVersion** (*in query*): string

  resourceVersion sets a constraint on what resource versions a request may be served from. See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.
  
  Defaults to unset


- **resourceVersionMatch** (*in query*): string

  resourceVersionMatch determines how resourceVersion is applied to list calls. It is highly recommended that resourceVersionMatch be set for list calls where resourceVersion is set See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.
  
  Defaults to unset


- **timeoutSeconds** (*in query*): integer

  Timeout for the list/watch call. This limits the duration of the call, regardless of any activity or inactivity.


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

  Force is going to "force" Apply requests. It means user will re-acquire conflicting fields owned by other people. Force flag must be unset for non-apply patch requests.


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

  Force is going to "force" Apply requests. It means user will re-acquire conflicting fields owned by other people. Force flag must be unset for non-apply patch requests.


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

  The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)


- **propagationPolicy** (*in query*): string

  Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.



#### Response


200 ([Status](../meta/status#Status)): OK

202 ([Status](../meta/status#Status)): Accepted


### `deletecollection` delete collection of FileWatch

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/filewatches

#### Parameters


- **body**: [DeleteOptions](../meta/delete-options#DeleteOptions)

  


- **continue** (*in query*): string

  The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server, the server will respond with a 410 ResourceExpired error together with a continue token. If the client needs a consistent list, it must restart their list without the continue field. Otherwise, the client may send another list request with the token received with the 410 error, the server will respond with a list starting from the next key, but from the latest snapshot, which is inconsistent from the previous list results - objects that are created, modified, or deleted after the first list request will be included in the response, as long as their keys are after the "next key".
  
  This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldSelector** (*in query*): string

  A selector to restrict the list of returned objects by their fields. Defaults to everything.


- **gracePeriodSeconds** (*in query*): integer

  The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.


- **labelSelector** (*in query*): string

  A selector to restrict the list of returned objects by their labels. Defaults to everything.


- **limit** (*in query*): integer

  limit is a maximum number of responses to return for a list call. If more items exist, the server will set the `continue` field on the list metadata to a value that can be used with the same initial query to retrieve the next set of results. Setting a limit may return fewer than the requested amount of items (up to zero items) in the event all requested objects are filtered out and clients should only use the presence of the continue field to determine whether more results are available. Servers may choose not to support the limit argument and will return all of the available results. If limit is specified and the continue field is empty, clients may assume that no more results are available. This field is not supported if watch is true.
  
  The server guarantees that the objects returned when using continue will be identical to issuing a single list call without a limit - that is, no objects created, modified, or deleted after the first request is issued will be included in any subsequent continued requests. This is sometimes referred to as a consistent snapshot, and ensures that a client that is using limit to receive smaller chunks of a very large result can ensure they see all possible objects. If objects are updated during a chunked list the version of the object that was present at the time the first list result was calculated is returned.


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)


- **propagationPolicy** (*in query*): string

  Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.


- **resourceVersion** (*in query*): string

  resourceVersion sets a constraint on what resource versions a request may be served from. See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.
  
  Defaults to unset


- **resourceVersionMatch** (*in query*): string

  resourceVersionMatch determines how resourceVersion is applied to list calls. It is highly recommended that resourceVersionMatch be set for list calls where resourceVersion is set See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.
  
  Defaults to unset


- **timeoutSeconds** (*in query*): integer

  Timeout for the list/watch call. This limits the duration of the call, regardless of any activity or inactivity.



#### Response


200 ([Status](../meta/status#Status)): OK

