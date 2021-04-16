---
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "PodLogStream"
content_type: "api_reference"
description: "PodLogStream

Streams logs from a pod on Kubernetes into the core Tilt engine."
title: "PodLogStream v1alpha1"
weight: 1
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## PodLogStream {#PodLogStream}

PodLogStream

Streams logs from a pod on Kubernetes into the core Tilt engine.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: PodLogStream


- **metadata** (<a href="{{< ref "../meta/object-meta#ObjectMeta" >}}">ObjectMeta</a>)


- **spec** (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStreamSpec" >}}">PodLogStreamSpec</a>)


- **status** (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStreamStatus" >}}">PodLogStreamStatus</a>)






## PodLogStreamSpec {#PodLogStreamSpec}

PodLogStreamSpec defines the desired state of PodLogStream

Translated into a PodLog query to the current Kubernetes cluster: https://pkg.go.dev/k8s.io/api/core/v1#PodLogOptions

which Kubernetes context to use?

<hr>

- **ignoreContainers** ([]string)

  The names of containers to exclude from the stream.
  
  If `onlyContainers` and `ignoreContainers` are not set, will watch all containers in the pod.

- **namespace** (string)

  The namespace of the pod to watch. Defaults to the kubecontext default namespace.

- **onlyContainers** ([]string)

  The names of containers to include in the stream.
  
  If `onlyContainers` and `ignoreContainers` are not set, will watch all containers in the pod.

- **pod** (string)

  The name of the pod to watch. Required.

- **sinceTime** (Time)

  An RFC3339 timestamp from which to show logs. If this value precedes the time a pod was started, only logs since the pod start will be returned. If this value is in the future, no logs will be returned.
  
  Translates directly to the underlying PodLogOptions.

  <a name="Time"></a>
  *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*





## PodLogStreamStatus {#PodLogStreamStatus}

PodLogStreamStatus defines the observed state of PodLogStream

<hr>

- **containerStatuses** ([]ContainerLogStreamStatus)

  A list of containers being watched.

  <a name="ContainerLogStreamStatus"></a>
  *ContainerLogStreamStatus defines the current status of each individual container log stream.*

  - **containerStatuses.active** (boolean)

    True when the stream is set up and streaming logs properly.

  - **containerStatuses.error** (string)

    The last error message encountered while streaming.
    
    Empty when the stream is actively streaming or successfully terminated.

  - **containerStatuses.name** (string)

    The name of the container.

  - **containerStatuses.terminated** (boolean)

    True when the logs are done stream and the container is terminated.





## PodLogStreamList {#PodLogStreamList}

PodLogStreamList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: PodLogStreamList


- **metadata** (<a href="{{< ref "../meta/list-meta#ListMeta" >}}">ListMeta</a>)


- **items** ([]<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>), required






## Operations {#Operations}



<hr>






### `get` read the specified PodLogStream

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/podlogstreams/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): OK


### `get` read status of the specified PodLogStream

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/podlogstreams/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): OK


### `list` list or watch objects of kind PodLogStream

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/podlogstreams

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

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>


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


200 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStreamList" >}}">PodLogStreamList</a>): OK


### `create` create a PodLogStream

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/podlogstreams

#### Parameters


- **body**: <a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): OK

201 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): Created

202 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): Accepted


### `update` replace the specified PodLogStream

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/podlogstreams/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **body**: <a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): OK

201 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): Created


### `update` replace status of the specified PodLogStream

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/podlogstreams/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **body**: <a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): OK

201 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): Created


### `patch` partially update the specified PodLogStream

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/podlogstreams/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **body**: <a href="{{< ref "../meta/patch#Patch" >}}">Patch</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **force** (*in query*): boolean

  Force is going to "force" Apply requests. It means user will re-acquire conflicting fields owned by other people. Force flag must be unset for non-apply patch requests.


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): OK


### `patch` partially update status of the specified PodLogStream

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/podlogstreams/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **body**: <a href="{{< ref "../meta/patch#Patch" >}}">Patch</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **force** (*in query*): boolean

  Force is going to "force" Apply requests. It means user will re-acquire conflicting fields owned by other people. Force flag must be unset for non-apply patch requests.


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../kubernetes/pod-log-stream-v1alpha1#PodLogStream" >}}">PodLogStream</a>): OK


### `delete` delete a PodLogStream

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/podlogstreams/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **body**: <a href="{{< ref "../meta/delete-options#DeleteOptions" >}}">DeleteOptions</a>

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **gracePeriodSeconds** (*in query*): integer

  The duration in seconds before the object should be deleted. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period for the specified type will be used. Defaults to a per object value if not specified. zero means delete immediately.


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>


- **propagationPolicy** (*in query*): string

  Whether and how garbage collection will be performed. Either this field or OrphanDependents may be set, but not both. The default policy is decided by the existing finalizer set in the metadata.finalizers and the resource-specific default policy. Acceptable values are: 'Orphan' - orphan the dependents; 'Background' - allow the garbage collector to delete the dependents in the background; 'Foreground' - a cascading policy that deletes all dependents in the foreground.



#### Response


200 (<a href="{{< ref "../meta/status#Status" >}}">Status</a>): OK

202 (<a href="{{< ref "../meta/status#Status" >}}">Status</a>): Accepted


### `deletecollection` delete collection of PodLogStream

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/podlogstreams

#### Parameters


- **body**: <a href="{{< ref "../meta/delete-options#DeleteOptions" >}}">DeleteOptions</a>

  


- **continue** (*in query*): string

  The continue option should be set when retrieving more results from the server. Since this value is server defined, clients may only use the continue value from a previous query result with identical query parameters (except for the value of continue) and the server may reject a continue value it does not recognize. If the specified continue value is no longer valid whether due to expiration (generally five to fifteen minutes) or a configuration change on the server, the server will respond with a 410 ResourceExpired error together with a continue token. If the client needs a consistent list, it must restart their list without the continue field. Otherwise, the client may send another list request with the token received with the 410 error, the server will respond with a list starting from the next key, but from the latest snapshot, which is inconsistent from the previous list results - objects that are created, modified, or deleted after the first list request will be included in the response, as long as their keys are after the "next key".
  
  This field is not supported when watch is true. Clients may start a watch from the last resourceVersion value returned by the server and not miss any modifications.


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


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

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>


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


200 (<a href="{{< ref "../meta/status#Status" >}}">Status</a>): OK

