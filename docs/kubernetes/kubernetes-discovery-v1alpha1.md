---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "KubernetesDiscovery"
content_type: "api_reference"
description: "KubernetesDiscovery."
title: "KubernetesDiscovery v1alpha1"
weight: 3
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## KubernetesDiscovery {#KubernetesDiscovery}


KubernetesDiscovery

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: KubernetesDiscovery


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([KubernetesDiscoverySpec](../kubernetes/kubernetes-discovery-v1alpha1#KubernetesDiscoverySpec))


- **status** ([KubernetesDiscoveryStatus](../kubernetes/kubernetes-discovery-v1alpha1#KubernetesDiscoveryStatus))






## KubernetesDiscoverySpec {#KubernetesDiscoverySpec}


KubernetesDiscoverySpec defines the desired state of KubernetesDiscovery

<hr>

- **watches** ([]KubernetesWatchRef), required

  Watches determine what resources are discovered.
  
  If a discovered resource (e.g. Pod) matches the KubernetesWatchRef UID exactly, it will be reported. If a discovered resource is transitively owned by the KubernetesWatchRef UID, it will be reported.

  <a name="KubernetesWatchRef"></a>
  *KubernetesWatchRef is similar to v1.ObjectReference from the Kubernetes API and is used to determine what objects should be reported on based on discovery.*

  - **watches.namespace** (string), required

    Namespace is the Kubernetes namespace for discovery. Required.

  - **watches.name** (string)

    Name is the Kubernetes object name.
    
    This is not directly used in discovery; it is extra metadata.

  - **watches.uid** (string)

    UID is a Kubernetes object UID.
    
    It should either be the exact object UID or the transitive owner.

- **cluster** (string)

  Cluster name to determine the Kubernetes cluster.
  
  If not provided, "default" will be used.

- **extraSelectors** ([]LabelSelector)

  ExtraSelectors are label selectors that will force discovery of a Pod even if it does not match the AncestorUID.
  
  This should only be necessary in the event that a CRD creates Pods but does not set an owner reference to itself.

  <a name="LabelSelector"></a>
  *A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects.*

  - **extraSelectors.matchExpressions** ([]LabelSelectorRequirement)

    matchExpressions is a list of label selector requirements. The requirements are ANDed.

    <a name="LabelSelectorRequirement"></a>
    *A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.*

  - **extraSelectors.matchExpressions.key** (string), required

    *Patch strategy: merge on key `key`*
    
    key is the label key that the selector applies to.

  - **extraSelectors.matchExpressions.operator** (string), required

    operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.

  - **extraSelectors.matchExpressions.values** ([]string)

    values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.

  - **extraSelectors.matchLabels** (map[string]string)

    matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

- **podLogStreamTemplateSpec** (PodLogStreamTemplateSpec)

  PodLogStreamTemplateSpec describes the data model for PodLogStreams that KubernetesDiscovery should set up.
  
  The KubernetesDiscovery controller will attach PodLogStream objects to all active pods it discovers.
  
  If no template is specified, the controller will stream all pod logs available from the apiserver.

  <a name="PodLogStreamTemplateSpec"></a>
  *PodLogStreamTemplateSpec describes common attributes for PodLogStreams that can be shared across pods.*

  - **podLogStreamTemplateSpec.ignoreContainers** ([]string)

    The names of containers to exclude from the stream.
    
    If `onlyContainers` and `ignoreContainers` are not set, will watch all containers in the pod.

  - **podLogStreamTemplateSpec.onlyContainers** ([]string)

    The names of containers to include in the stream.
    
    If `onlyContainers` and `ignoreContainers` are not set, will watch all containers in the pod.

  - **podLogStreamTemplateSpec.sinceTime** (Time)

    An RFC3339 timestamp from which to show logs. If this value precedes the time a pod was started, only logs since the pod start will be returned. If this value is in the future, no logs will be returned.
    
    Translates directly to the underlying PodLogOptions.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

- **portForwardTemplateSpec** (PortForwardTemplateSpec)

  PortForwardTemplateSpec describes the data model for port forwards that KubernetesDiscovery should set up.
  
  The KubernetesDiscovery controller will choose a "best" candidate for attaching the port-forwarding. Only one PortForward will be active at a time.

  <a name="PortForwardTemplateSpec"></a>
  *PortForwardTemplateSpec describes common attributes for PortForwards that can be shared across pods.*

  - **portForwardTemplateSpec.forwards** ([]Forward), required

    One or more port forwards to execute on the given pod. Required.

    <a name="Forward"></a>
    *Forward defines a port forward to execute on a given pod.*

  - **portForwardTemplateSpec.forwards.containerPort** (int32), required

    The port on the Kubernetes pod to connect to. Required.

  - **portForwardTemplateSpec.forwards.host** (string)

    Optional host to bind to on the current machine (localhost by default)

  - **portForwardTemplateSpec.forwards.localPort** (int32)

    The port to expose on the current machine.
    
    If not specified (or 0), a random free port will be chosen and can be discovered via the status once established.

  - **portForwardTemplateSpec.forwards.name** (string)

    Name to identify this port forward.

  - **portForwardTemplateSpec.forwards.path** (string)

    Path to include as part of generated links for port forward.





## KubernetesDiscoveryStatus {#KubernetesDiscoveryStatus}


KubernetesDiscoveryStatus defines the observed state of KubernetesDiscovery

<hr>

- **pods** ([]Pod), required

  Pods that have been discovered based on the criteria in the spec.

  <a name="Pod"></a>
  *Pod is a collection of containers that can run on a host.
  
  The Tilt API representation mirrors the Kubernetes API very closely. Irrelevant data is not included, and some fields might be simplified.
  
  There might also be Tilt-specific status fields.*

  - **pods.containers** ([]Container), required

    Containers are the containers belonging to the Pod.

    <a name="Container"></a>
    *Container is an init or application container within a pod.
    
    The Tilt API representation mirrors the Kubernetes API very closely. Irrelevant data is not included, and some fields might be simplified.
    
    There might also be Tilt-specific status fields.*

  - **pods.containers.id** (string), required

    ID is the normalized container ID (the `docker://` prefix is stripped).

  - **pods.containers.image** (string), required

    Image is the image the container is running.

  - **pods.containers.name** (string), required

    Name is the name of the container as defined in Kubernetes.

  - **pods.containers.ports** ([]int32), required

    Ports are exposed ports as extracted from the Pod spec.
    
    This is added by Tilt for convenience when managing port forwards.

  - **pods.containers.ready** (boolean), required

    Ready is true if the container is passing readiness checks (or has none defined).

  - **pods.containers.restarts** (int32), required

    Restarts is the number of times the container has restarted.
    
    This includes restarts before the Tilt daemon was started if the container was already running.

  - **pods.containers.state** (ContainerState), required

    State provides details about the container's current condition.

    <a name="ContainerState"></a>
    *ContainerState holds a possible state of container.
    
    Only one of its members may be specified. If none of them is specified, the default one is ContainerStateWaiting.*

  - **pods.containers.state.running** (ContainerStateRunning), required

    Running provides details about a currently executing container.

    <a name="ContainerStateRunning"></a>
    *ContainerStateRunning is a running state of a container.*

  - **pods.containers.state.running.startedAt** (Time), required

    StartedAt is the time the container began running.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **pods.containers.state.terminated** (ContainerStateTerminated), required

    Terminated provides details about an exited container.

    <a name="ContainerStateTerminated"></a>
    *ContainerStateTerminated is a terminated state of a container.*

  - **pods.containers.state.terminated.exitCode** (int32), required

    ExitCode is the exit status from the termination of the container.
    
    Any non-zero value indicates an error during termination.

  - **pods.containers.state.terminated.finishedAt** (Time), required

    FinishedAt is the time the container stopped running.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **pods.containers.state.terminated.startedAt** (Time), required

    StartedAt is the time the container began running.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **pods.containers.state.terminated.reason** (string)

    Reason is a (brief) reason the container stopped running.

  - **pods.containers.state.waiting** (ContainerStateWaiting), required

    Waiting provides details about a container that is not yet running.

    <a name="ContainerStateWaiting"></a>
    *ContainerStateWaiting is a waiting state of a container.*

  - **pods.containers.state.waiting.reason** (string), required

    Reason is a (brief) reason the container is not yet running.

  - **pods.createdAt** (Time), required

    CreatedAt is when the Pod was created.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **pods.deleting** (boolean), required

    Deleting indicates that the Pod is in the process of being removed.

  - **pods.errors** ([]string), required

    Errors are aggregated error messages for the Pod and its containers.

  - **pods.name** (string), required

    Name is the Pod name within the K8s cluster.

  - **pods.namespace** (string), required

    Namespace is the Pod namespace within the K8s cluster.

  - **pods.phase** (string), required

    Phase is where the Pod is at in its current lifecycle.
    
    Valid values for this are v1.PodPhase values from the Kubernetes API.

  - **pods.status** (string), required

    Status is a concise description for the Pod's current state.
    
    This is based off the status output from `kubectl get pod` and is not an "enum-like" value.

  - **pods.uid** (string), required

    UID is the unique Pod UID within the K8s cluster.

  - **pods.ancestorUID** (string)

    AncestorUID is the UID from the WatchRef that matched this Pod.
    
    If the Pod matched based on extra label selectors, this will be empty.

  - **pods.conditions** ([]PodCondition)

    Conditions are various lifecycle conditions for this Pod.
    
    See also v1.PodCondition in the Kubernetes API.

    <a name="PodCondition"></a>
    *PodCondition is a lifecycle condition for a Pod.*

  - **pods.conditions.status** (string), required

    Status is the current state of the condition (True, False, or Unknown).
    
    Valid values for this are v1.PodConditionStatus values from the Kubernetes API.

  - **pods.conditions.type** (string), required

    Type is the type of condition.
    
    Valid values for this are v1.PodConditionType values from the Kubernetes API.

  - **pods.conditions.lastTransitionTime** (Time)

    LastTransitionTime is the last time the status changed.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **pods.conditions.message** (string)

    Message is a human-readable description of the last status change.

  - **pods.conditions.reason** (string)

    Reason is a unique, one-word, CamelCase value for the cause of the last status change.

  - **pods.initContainers** ([]Container)

    InitContainers are containers executed prior to the Pod containers being executed.

    <a name="Container"></a>
    *Container is an init or application container within a pod.
    
    The Tilt API representation mirrors the Kubernetes API very closely. Irrelevant data is not included, and some fields might be simplified.
    
    There might also be Tilt-specific status fields.*

  - **pods.initContainers.id** (string), required

    ID is the normalized container ID (the `docker://` prefix is stripped).

  - **pods.initContainers.image** (string), required

    Image is the image the container is running.

  - **pods.initContainers.name** (string), required

    Name is the name of the container as defined in Kubernetes.

  - **pods.initContainers.ports** ([]int32), required

    Ports are exposed ports as extracted from the Pod spec.
    
    This is added by Tilt for convenience when managing port forwards.

  - **pods.initContainers.ready** (boolean), required

    Ready is true if the container is passing readiness checks (or has none defined).

  - **pods.initContainers.restarts** (int32), required

    Restarts is the number of times the container has restarted.
    
    This includes restarts before the Tilt daemon was started if the container was already running.

  - **pods.initContainers.state** (ContainerState), required

    State provides details about the container's current condition.

    <a name="ContainerState"></a>
    *ContainerState holds a possible state of container.
    
    Only one of its members may be specified. If none of them is specified, the default one is ContainerStateWaiting.*

  - **pods.initContainers.state.running** (ContainerStateRunning), required

    Running provides details about a currently executing container.

    <a name="ContainerStateRunning"></a>
    *ContainerStateRunning is a running state of a container.*

  - **pods.initContainers.state.running.startedAt** (Time), required

    StartedAt is the time the container began running.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **pods.initContainers.state.terminated** (ContainerStateTerminated), required

    Terminated provides details about an exited container.

    <a name="ContainerStateTerminated"></a>
    *ContainerStateTerminated is a terminated state of a container.*

  - **pods.initContainers.state.terminated.exitCode** (int32), required

    ExitCode is the exit status from the termination of the container.
    
    Any non-zero value indicates an error during termination.

  - **pods.initContainers.state.terminated.finishedAt** (Time), required

    FinishedAt is the time the container stopped running.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **pods.initContainers.state.terminated.startedAt** (Time), required

    StartedAt is the time the container began running.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **pods.initContainers.state.terminated.reason** (string)

    Reason is a (brief) reason the container stopped running.

  - **pods.initContainers.state.waiting** (ContainerStateWaiting), required

    Waiting provides details about a container that is not yet running.

    <a name="ContainerStateWaiting"></a>
    *ContainerStateWaiting is a waiting state of a container.*

  - **pods.initContainers.state.waiting.reason** (string), required

    Reason is a (brief) reason the container is not yet running.

  - **pods.owner** (PodOwner)

    Direct owner of this pod, if available.

    <a name="PodOwner"></a>
    *PodOwner contains information of the direct owner of the pod, if available.
    
    Tools that need to select a most relevant pod or set of pods can use this info to group pods by owner.*

  - **pods.owner.apiVersion** (string), required

    API version of the owner.

  - **pods.owner.kind** (string), required

    Kind of the owner More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

  - **pods.owner.name** (string), required

    The name of the owner.

  - **pods.owner.creationTimestamp** (Time)

    The creation timestamp of the owner.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **pods.podTemplateSpecHash** (string)

    PodTemplateSpecHash is a hash of the Pod template spec.
    
    Tilt uses this to associate Pods with the build that triggered them.

- **monitorStartTime** (MicroTime)

  MonitorStartTime is the timestamp of when Kubernetes resource discovery was started.
  
  It is zero if discovery has not been started yet.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **running** (KubernetesDiscoveryStateRunning)

  Running contains information about the currently running monitor.

  <a name="KubernetesDiscoveryStateRunning"></a>
  **

  - **running.startTime** (MicroTime), required

    StartTime is when Kubernetes resource discovery began.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **waiting** (KubernetesDiscoveryStateWaiting)

  Waiting contains information about why the monitor has not started.

  <a name="KubernetesDiscoveryStateWaiting"></a>
  **

  - **waiting.reason** (string), required

    Reason the monitor has not yet been started.





## KubernetesDiscoveryList {#KubernetesDiscoveryList}


KubernetesDiscoveryList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: KubernetesDiscoveryList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][KubernetesDiscovery](../kubernetes/kubernetes-discovery-v1alpha1#KubernetesDiscovery)), required









<hr>



