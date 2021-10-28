---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "PortForward"
content_type: "api_reference"
description: "PortForward."
title: "PortForward v1alpha1"
weight: 2
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## PortForward {#PortForward}

PortForward

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: PortForward


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([PortForwardSpec](../kubernetes/port-forward-v1alpha1#PortForwardSpec))


- **status** ([PortForwardStatus](../kubernetes/port-forward-v1alpha1#PortForwardStatus))






## PortForwardSpec {#PortForwardSpec}

PortForwardSpec defines the desired state of PortForward

<hr>

- **forwards** ([]Forward), required

  One or more port forwards to execute on the given pod. Required.

  <a name="Forward"></a>
  *Forward defines a port forward to execute on a given pod.*

  - **forwards.containerPort** (int32), required

    The port on the Kubernetes pod to connect to. Required.

  - **forwards.host** (string)

    Optional host to bind to on the current machine (localhost by default)

  - **forwards.localPort** (int32)

    The port to expose on the current machine.
    
    If not specified (or 0), a random free port will be chosen and can be discovered via the status once established.

- **podName** (string), required

  The name of the pod to port forward to/from. Required.

- **namespace** (string)

  The namespace of the pod to port forward to/from. Defaults to the kubecontext default namespace.





## PortForwardStatus {#PortForwardStatus}

PortForwardStatus defines the observed state of PortForward

<hr>

- **forwardStatuses** ([]ForwardStatus)


  <a name="ForwardStatus"></a>
  **

  - **forwardStatuses.addresses** ([]string), required

    Addresses that the forwarder is bound to.
    
    For example, a `localhost` host will bind to 127.0.0.1 and [::1].

  - **forwardStatuses.containerPort** (int32), required

    ContainerPort is the port in the container being forwarded.

  - **forwardStatuses.localPort** (int32), required

    LocalPort is the port bound to on the system running Tilt.

  - **forwardStatuses.error** (string)

    Error is a human-readable description if a problem was encountered while initializing the forward.

  - **forwardStatuses.startedAt** (MicroTime)

    StartedAt is the time at which the forward was initiated.
    
    If the forwarder is not running yet, this will be zero/empty.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*





## PortForwardList {#PortForwardList}

PortForwardList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: PortForwardList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][PortForward](../kubernetes/port-forward-v1alpha1#PortForward)), required






## Operations {#Operations}



<hr>






### `get` read the specified PortForward

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/portforwards/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PortForward


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): OK


### `get` read status of the specified PortForward

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/portforwards/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PortForward


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): OK


### `list` list or watch objects of kind PortForward

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/portforwards

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


200 ([PortForwardList](../kubernetes/port-forward-v1alpha1#PortForwardList)): OK


### `create` create a PortForward

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/portforwards

#### Parameters


- **body**: [PortForward](../kubernetes/port-forward-v1alpha1#PortForward), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): OK

201 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): Created

202 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): Accepted


### `update` replace the specified PortForward

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/portforwards/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PortForward


- **body**: [PortForward](../kubernetes/port-forward-v1alpha1#PortForward), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): OK

201 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): Created


### `update` replace status of the specified PortForward

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/portforwards/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PortForward


- **body**: [PortForward](../kubernetes/port-forward-v1alpha1#PortForward), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): OK

201 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): Created


### `patch` partially update the specified PortForward

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/portforwards/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PortForward


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


200 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): OK

201 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): Created


### `patch` partially update status of the specified PortForward

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/portforwards/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the PortForward


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


200 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): OK

201 ([PortForward](../kubernetes/port-forward-v1alpha1#PortForward)): Created


### `delete` delete a PortForward

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/portforwards/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the PortForward


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


### `deletecollection` delete collection of PortForward

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/portforwards

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

