---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "PortForward"
content_type: "api_reference"
description: "PortForward."
title: "PortForward v1alpha1"
weight: 9
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

  - **forwards.name** (string)

    Name to identify this port forward.

  - **forwards.path** (string)

    Path to include as part of generated links for port forward.

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









<hr>



