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
weight: 7
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









<hr>



