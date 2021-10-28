---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "LiveUpdate"
content_type: "api_reference"
description: "LiveUpdate."
title: "LiveUpdate v1alpha1"
weight: 6
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## LiveUpdate {#LiveUpdate}

LiveUpdate

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: LiveUpdate


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([LiveUpdateSpec](../kubernetes/live-update-v1alpha1#LiveUpdateSpec))


- **status** ([LiveUpdateStatus](../kubernetes/live-update-v1alpha1#LiveUpdateStatus))






## LiveUpdateSpec {#LiveUpdateSpec}

LiveUpdateSpec defines the desired state of LiveUpdate

<hr>

- **basePath** (string), required

  An absolute local path that serves as the basis for all path calculations.
  
  Relative paths in this object are calculated relative to the base path. It cannot be empty.

- **selector** (LiveUpdateSelector), required

  Specifies how this live-updater finds the containers that need live update.

  <a name="LiveUpdateSelector"></a>
  *Specifies how to select containers to live update.
  
  Every live update must be associated with some object for finding containers. In the future, we expect there to be other types of container discovery objects (like Docker Compose container discovery).*

  - **selector.kubernetes** (LiveUpdateKubernetesSelector)

    Finds containers in Kubernetes.

    <a name="LiveUpdateKubernetesSelector"></a>
    *Specifies how to select containers to live update inside K8s.*

  - **selector.kubernetes.applyName** (string)

    ApplyName is the name of a KubernetesApply object for filtering discovered pods to prevent updating old deployments.
    
    If not provided, no filtering will be applied and all discovered Pods will be eligible for update.

  - **selector.kubernetes.discoveryName** (string)

    The name of a KubernetesDiscovery object for finding pods.

  - **selector.kubernetes.image** (string)

    Image specifies the name of the image that we're copying files into. Determines which containers in a pod to live-update. Matches images by name unless tag is explicitly specified.

  - **selector.kubernetes.imageMapName** (string)

    Name of the ImageMap object to watch for which file changes are included in the container image.
    
    If not provided, the live-updater will copy any file changes that it's aware of, even if they're already included in the container.

- **execs** ([]LiveUpdateExec)

  A list of commands to run inside the container after files are synced.
  
  NB: In some documentation, we call these 'runs'. 'exec' more clearly matches kubectl exec for remote commands.

  <a name="LiveUpdateExec"></a>
  *Runs a remote command after files have been synced to the container. Commonly used for small in-container changes (like moving files around, or restart processes).*

  - **execs.args** ([]string), required

    Command-line arguments to run inside the container. Must have length at least 1.

  - **execs.triggerPaths** ([]string)

    A list of relative paths that trigger this command exec.
    
    If not specified, all file changes seen by the LiveUpdate trigger this exec.
    
    Paths are specified relative to the the BasePath of the LiveUpdate.

- **fileWatchNames** ([]string)

  Names of ileWatch objects to watch for a list of files that have recently been updated.
  
  Every live update must be associated with at least one FileWatch object to trigger the update. Usually, Tilt structures it so that there's a FileWatch for each image we depend on.

- **restart** (string)

  Specifies whether Tilt should try to natively restart the container in-place after syncs and execs.
  
  Note that native restarts are only supported by Docker and Docker Compose (and NOT docker-shim or containerd, the most common Kubernetes runtimes).
  
  To restart on live-update in Kubernetes, see the guide for how to apply extensions to add restart behavior:
  
  https://docs.tilt.dev/live_update_reference.html

- **stopPaths** ([]string)

  A list of relative paths that will immediately stop the live-update for the current container.
  
  Used to detect file changes that invalidate the entire container image, forcing a complete rebuild.

- **syncs** ([]LiveUpdateSync)

  Specify paths that can be live-updated into the container and their destinations. Any file changes observed that do not match any of these will invalidate the container image and force a complete rebuild.

  <a name="LiveUpdateSync"></a>
  *Determines how a local path maps into a container image.*

  - **syncs.containerPath** (string), required

    An absolute path inside the container. Required.

  - **syncs.localPath** (string), required

    A relative path to local files. Required.
    
    Computed relative to the live-update BasePath.





## LiveUpdateStatus {#LiveUpdateStatus}

LiveUpdateStatus defines the observed state of LiveUpdate

<hr>

- **containers** ([]LiveUpdateContainerStatus)

  A list of all containers that the live-updater is currently connected to.

  <a name="LiveUpdateContainerStatus"></a>
  *LiveUpdateContainerStatus defines the observed state of the live-update syncer for a particular container.*

  - **containers.containerName** (string), required

    The name of the container in the pod.

  - **containers.namespace** (string), required

    The namespace of the pod this container belongs to.

  - **containers.podName** (string), required

    The name of the pod this container belongs to.

  - **containers.containerID** (string)

    The ID of the container in the pod, in the format 'docker://\<container_id>'.

  - **containers.lastExecError** (string)

    Contains any error messages from the most recent sequence of Execs.
    
    Empty if the most recent Execs completed successfully.
    
    An ExecError is not necessarily a failure state. For example, a linter error in the container is something we'd want to surface to the user, but not an indication that the live-updater did something wrong.

  - **containers.lastFileTimeSynced** (MicroTime)

    The timestamp of the most recent file update successfully synced to the container.
    
    Must match the timestamp in a FileEvent, not the time the sync was performed.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **failed** (LiveUpdateStateFailed)

  If any of the containers are currently failing to process updates, the Failed state surfaces information about what's happening and what the live-updater is doing to fix the problem.
  
  If all containers are updating successfully, Failed will be nil.

  <a name="LiveUpdateStateFailed"></a>
  *If any of the containers are currently failing to process updates, the LiveUpdateStateFailed surfaces information about what's happening and what the live-updater is doing to fix the problem.*

  - **failed.lastTransitionTime** (MicroTime)

    When the live-updater transitioned into a Failed state.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **failed.message** (string)

    Human-readable description of what's wrong.

  - **failed.reason** (string)

    One word camel-case reason why we've reached a failure state.





## LiveUpdateList {#LiveUpdateList}

LiveUpdateList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: LiveUpdateList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)), required






## Operations {#Operations}



<hr>






### `get` read the specified LiveUpdate

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/liveupdates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the LiveUpdate


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): OK


### `get` read status of the specified LiveUpdate

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/liveupdates/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the LiveUpdate


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): OK


### `list` list or watch objects of kind LiveUpdate

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/liveupdates

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


200 ([LiveUpdateList](../kubernetes/live-update-v1alpha1#LiveUpdateList)): OK


### `create` create a LiveUpdate

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/liveupdates

#### Parameters


- **body**: [LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): OK

201 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): Created

202 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): Accepted


### `update` replace the specified LiveUpdate

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/liveupdates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the LiveUpdate


- **body**: [LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): OK

201 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): Created


### `update` replace status of the specified LiveUpdate

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/liveupdates/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the LiveUpdate


- **body**: [LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): OK

201 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): Created


### `patch` partially update the specified LiveUpdate

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/liveupdates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the LiveUpdate


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


200 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): OK

201 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): Created


### `patch` partially update status of the specified LiveUpdate

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/liveupdates/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the LiveUpdate


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


200 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): OK

201 ([LiveUpdate](../kubernetes/live-update-v1alpha1#LiveUpdate)): Created


### `delete` delete a LiveUpdate

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/liveupdates/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the LiveUpdate


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


### `deletecollection` delete collection of LiveUpdate

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/liveupdates

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

