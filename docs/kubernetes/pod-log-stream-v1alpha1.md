---
layout: api
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


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([PodLogStreamSpec](../kubernetes/pod-log-stream-v1alpha1#PodLogStreamSpec))


- **status** ([PodLogStreamStatus](../kubernetes/pod-log-stream-v1alpha1#PodLogStreamStatus))






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


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)), required






## Operations {#Operations}



<hr>






### `get` read the specified PodLogStream

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/podlogstreams/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): OK


### `get` read status of the specified PodLogStream

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/podlogstreams/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): OK


### `list` list or watch objects of kind PodLogStream

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/podlogstreams

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


200 ([PodLogStreamList](../kubernetes/pod-log-stream-v1alpha1#PodLogStreamList)): OK


### `create` create a PodLogStream

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/podlogstreams

#### Parameters


- **body**: [PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): OK

201 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): Created

202 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): Accepted


### `update` replace the specified PodLogStream

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/podlogstreams/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **body**: [PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): OK

201 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): Created


### `update` replace status of the specified PodLogStream

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/podlogstreams/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


- **body**: [PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): OK

201 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): Created


### `patch` partially update the specified PodLogStream

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/podlogstreams/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


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


200 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): OK


### `patch` partially update status of the specified PodLogStream

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/podlogstreams/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


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


200 ([PodLogStream](../kubernetes/pod-log-stream-v1alpha1#PodLogStream)): OK


### `delete` delete a PodLogStream

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/podlogstreams/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PodLogStream


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


### `deletecollection` delete collection of PodLogStream

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/podlogstreams

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

