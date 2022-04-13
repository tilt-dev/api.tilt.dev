---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "UIResource"
content_type: "api_reference"
description: "UIResource represents per-resource status data for rendering the web UI."
title: "UIResource v1alpha1"
weight: 2
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## UIResource {#UIResource}


UIResource represents per-resource status data for rendering the web UI.

Treat this as a legacy data structure that's more intended to make transition easier rather than a robust long-term API.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: UIResource


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([UIResourceSpec](../interface/ui-resource-v1alpha1#UIResourceSpec))


- **status** ([UIResourceStatus](../interface/ui-resource-v1alpha1#UIResourceStatus))






## UIResourceSpec {#UIResourceSpec}


UIResourceSpec is an empty struct. UIResource is a kludge for making Tilt's internal status readable, not for specifying behavior.

<hr>





## UIResourceStatus {#UIResourceStatus}


UIResourceStatus defines the observed state of UIResource

<hr>

- **buildHistory** ([]UIBuildTerminated)

  Past completed builds.

  <a name="UIBuildTerminated"></a>
  *UIBuildRunning respresents a finished build/update in the user interface.*

  - **buildHistory.error** (string)

    A non-empty string if the build failed with an error.

  - **buildHistory.finishTime** (MicroTime)

    The time when the build finished.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **buildHistory.isCrashRebuild** (boolean)

    A crash rebuild happens when Tilt live-updated a container, then the pod crashed, wiping out the live-updates. Tilt does a full build+deploy to reset the pod state to what's on disk.

  - **buildHistory.spanID** (string)

    The log span where the build logs are stored in the logstore.

  - **buildHistory.startTime** (MicroTime)

    The time when the build started.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **buildHistory.warnings** ([]string)

    A list of warnings encountered while running the build. These warnings will also be printed to the build's log.

- **conditions** ([]UIResourceCondition)

  Represents the latest available observations of a UIResource's current state.
  
  Designed for compatibility with 'wait' and cross-resource status reporting. https://github.com/kubernetes/community/blob/master/contributors/devel/sig-architecture/api-conventions.md#typical-status-properties

  <a name="UIResourceCondition"></a>
  **

  - **conditions.status** (string), required

    Status of the condition, one of True, False, Unknown.

  - **conditions.type** (string), required

    Type of UI Resource condition.

  - **conditions.lastTransitionTime** (MicroTime)

    Last time the condition transitioned from one status to another.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **conditions.message** (string)

    A human readable message indicating details about the transition.

  - **conditions.reason** (string)

    The reason for the condition's last transition.

- **currentBuild** (UIBuildRunning)

  The currently running build, if any.

  <a name="UIBuildRunning"></a>
  *UIBuildRunning respresents an in-progress build/update in the user interface.*

  - **currentBuild.spanID** (string)

    The log span where the build logs are stored in the logstore.

  - **currentBuild.startTime** (MicroTime)

    The time when the build started.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **disableStatus** (DisableResourceStatus)

  Information about the resource's objects' disabled status.

  <a name="DisableResourceStatus"></a>
  *Aggregated disable status of DisableSources that belong to a resource.*

  - **disableStatus.disabledCount** (int32), required

    How many of the resource's sources are disabled.

  - **disableStatus.enabledCount** (int32), required

    How many of the resource's sources are enabled.

  - **disableStatus.sources** ([]DisableSource), required

    All unique sources that control the resource's objects' disable status.

    <a name="DisableSource"></a>
    *Points at a thing that can control whether something is disabled*

  - **disableStatus.sources.configMap** (ConfigMapDisableSource)

    Disabled by single ConfigMap value.

    <a name="ConfigMapDisableSource"></a>
    *Specifies a ConfigMap to control a DisableSource*

  - **disableStatus.sources.configMap.key** (string), required

    The key where the enable/disable state is stored.

  - **disableStatus.sources.configMap.name** (string), required

    The name of the ConfigMap

  - **disableStatus.sources.everyConfigMap** ([]ConfigMapDisableSource)

    Disabled by multiple ConfigMap values, which must all be set to disabled to disable the object.

    <a name="ConfigMapDisableSource"></a>
    *Specifies a ConfigMap to control a DisableSource*

  - **disableStatus.sources.everyConfigMap.key** (string), required

    The key where the enable/disable state is stored.

  - **disableStatus.sources.everyConfigMap.name** (string), required

    The name of the ConfigMap

  - **disableStatus.state** (string), required

    Whether this is currently disabled (if known)

- **endpointLinks** ([]UIResourceLink)

  Links attached to this resource.

  <a name="UIResourceLink"></a>
  *UIResourceLink represents a link assocatiated with a UIResource.*

  - **endpointLinks.name** (string)

    The display label on a URL.

  - **endpointLinks.url** (string)

    A URL to link to.

- **hasPendingChanges** (boolean)

  True if the build was put in the pending queue due to file changes.

- **k8sResourceInfo** (UIResourceKubernetes)

  Extra data about Kubernetes resources.

  <a name="UIResourceKubernetes"></a>
  *UIResourceKubernetes contains status information specific to Kubernetes.*

  - **k8sResourceInfo.allContainersReady** (boolean)

    Whether all the containers in the pod are currently healthy and have passed readiness checks.

  - **k8sResourceInfo.displayNames** ([]string)

    The list of all resources deployed in the Kubernetes deploy for this resource.

  - **k8sResourceInfo.podCreationTime** (Time)

    The creation time of the active pod.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **k8sResourceInfo.podName** (string)

    The name of the active pod.
    
    The active pod tends to be what Tilt defaults to for port-forwards, live-updates, etc.

  - **k8sResourceInfo.podRestarts** (int32)

    The number of pod restarts.

  - **k8sResourceInfo.podStatus** (string)

    The status of the active pod.

  - **k8sResourceInfo.podStatusMessage** (string)

    Extra error messaging around the current status of the active pod.

  - **k8sResourceInfo.podUpdateStartTime** (Time)

    The last update time of the active pod

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **k8sResourceInfo.spanID** (string)

    The span where this pod stores its logs in the Tilt logstore.

- **lastDeployTime** (MicroTime)

  The last time this resource was deployed.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **localResourceInfo** (UIResourceLocal)

  Extra data about Local resources

  <a name="UIResourceLocal"></a>
  *UIResourceLocal contains status information specific to local commands.*

  - **localResourceInfo.isTest** (boolean)

    Whether this represents a test job.
    
    Deprecated: Users should use labels for marking services as tests.

  - **localResourceInfo.pid** (int64)

    The PID of the actively running local command.

- **order** (int32)

  Order expresses the relative order of resources in the UI when they're not otherwise sorted. Lower integers go first. When two resources have the same order, they should be sorted by name.
  
  When UIResources are generated from the Tiltfile, we use the order they were added to the Tiltfile for the Order field.

- **pendingBuildSince** (MicroTime)

  When the build was put in the pending queue.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **queued** (boolean)

  Queued is a simple indicator of whether the resource is queued for an update.

- **runtimeStatus** (string)

  The RuntimeStatus is a simple, high-level summary of the runtime state of a server.
  
  Not all resources run servers.

- **specs** ([]UIResourceTargetSpec)

  Information about all the target specs that this resource summarizes.

  <a name="UIResourceTargetSpec"></a>
  *UIResourceTargetSpec represents the spec of a build or deploy that a resource summarizes.*

  - **specs.hasLiveUpdate** (boolean)

    Whether the target has a live update assocated with it.

  - **specs.id** (string)

    The ID of the target.

  - **specs.type** (string)

    The type of the target.

- **triggerMode** (int32)

  Bit mask representing whether this resource is run when: 1) When a file changes 2) When the resource initializes

- **updateStatus** (string)

  The UpdateStatus is a simple, high-level summary of any update tasks to bring the resource up-to-date.
  
  If the resource runs a server, this may include both build tasks and live-update syncing.

- **waiting** (UIResourceStateWaiting)

  Waiting provides detail on why the resource is currently blocked from updating.

  <a name="UIResourceStateWaiting"></a>
  **

  - **waiting.reason** (string), required

    Reason is a unique, one-word reason for why the UIResource update is pending.

  - **waiting.on** ([]UIResourceStateWaitingOnRef)

    HoldingOn is the set of objects blocking this resource from updating.
    
    These objects might NOT be explicit dependencies of the current resource. For example, if an un-parallelizable resource is updating, all other resources with queued updates will be holding on it with a reason of `waiting-for-local`.

    <a name="UIResourceStateWaitingOnRef"></a>
    **

  - **waiting.on.apiVersion** (string), required

    APIVersion for the object type being waited on.

  - **waiting.on.group** (string), required

    Group for the object type being waited on.

  - **waiting.on.kind** (string), required

    Kind of the object type being waited on.

  - **waiting.on.name** (string), required

    Name of the object being waiting on.





## UIResourceList {#UIResourceList}


UIResourceList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: UIResourceList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][UIResource](../interface/ui-resource-v1alpha1#UIResource)), required









<hr>



