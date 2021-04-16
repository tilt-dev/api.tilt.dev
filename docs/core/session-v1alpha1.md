---
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "Session"
content_type: "api_reference"
description: "Session provides introspective data about the status of the Tilt process."
title: "Session v1alpha1"
weight: 3
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## Session {#Session}

Session provides introspective data about the status of the Tilt process.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: Session


- **metadata** (<a href="{{< ref "../meta/object-meta#ObjectMeta" >}}">ObjectMeta</a>)


- **spec** (<a href="{{< ref "../core/session-v1alpha1#SessionSpec" >}}">SessionSpec</a>)


- **status** (<a href="{{< ref "../core/session-v1alpha1#SessionStatus" >}}">SessionStatus</a>)






## SessionSpec {#SessionSpec}

SessionSpec defines the desired state of Session

<hr>

- **exitCondition** (string), required

  ExitCondition defines the criteria for Tilt to exit.

- **tiltfilePath** (string), required

  TiltfilePath is the path to the Tiltfile for the run. It cannot be empty.





## SessionStatus {#SessionStatus}

SessionStatus defines the observed state of Session

<hr>

- **done** (boolean), required

  Done indicates whether this Session has completed its work and is ready to exit.

- **pid** (int64), required

  PID is the process identifier for this instance of Tilt.

- **startTime** (MicroTime), required

  StartTime is when the Tilt engine was first started.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **targets** ([]Target), required

  Targets are normalized representations of the servers/jobs managed by this Session.
  
  A resource from a Tiltfile might produce one or more targets. A target can also be shared across multiple resources (e.g. an image referenced by multiple K8s pods).

  <a name="Target"></a>
  *Target is a server or job whose execution is managed as part of this Session.*

  - **targets.name** (string), required

    Name is the name of the target; this is auto-generated from Tiltfile resources.

  - **targets.resources** ([]string), required

    Resources are one or more Tiltfile resources that this target is associated with.

  - **targets.state** (TargetState), required

    State provides information about the current status of the target.

    <a name="TargetState"></a>
    *TargetState describes the current execution status for a target.
    
    Either EXACTLY one of Waiting, Active, or Terminated will be populated or NONE of them will be. In the event that all states are null, the target is currently inactive or disabled and should not be expected to execute.*

  - **targets.state.active** (TargetStateActive)

    Active being non-nil indicates that the target is currently executing.

    <a name="TargetStateActive"></a>
    *TargetStateActive is a target that is currently running but has not yet finished.*

  - **targets.state.active.ready** (boolean), required

    Ready indicates that the target has passed readiness checks.
    
    If the target does not use or support readiness checks, this is always true.

  - **targets.state.active.startTime** (MicroTime), required

    StartTime is when execution began.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **targets.state.terminated** (TargetStateTerminated)

    Terminated being non-nil indicates that the target finished execution either normally or due to failure.

    <a name="TargetStateTerminated"></a>
    *TargetStateTerminated is a target that finished running, either because it completed successfully or encountered an error.*

  - **targets.state.terminated.finishTime** (MicroTime), required

    FinishTime is when the target stopped executing.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **targets.state.terminated.startTime** (MicroTime), required

    StartTime is when the target began executing.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **targets.state.terminated.error** (string)

    Error is a non-empty string if the target encountered a failure during execution that caused it to stop.
    
    For targets of type TargetTypeServer, this is always populated, as the target is expected to run indefinitely, and thus any termination is an error.

  - **targets.state.waiting** (TargetStateWaiting)

    Waiting being non-nil indicates that the next execution of the target has been queued but not yet started.

    <a name="TargetStateWaiting"></a>
    *TargetStateWaiting is a target that has been enqueued for execution but has not yet started.*

  - **targets.state.waiting.waitReason** (string), required

    WaitReason is a description for why the target is waiting and not yet active.
    
    This is NOT the "cause" or "trigger" for the target being invoked.

  - **targets.type** (string), required

    Type is the execution profile for this resource.
    
    Job targets run to completion (e.g. a build script or database migration script). Server targets run indefinitely (e.g. an HTTP server).

- **error** (string)

  Error is a non-empty string when the Session is Done but encountered a failure as defined by the ExitCondition from the SessionSpec.





## SessionList {#SessionList}

SessionList is a list of Session objects.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: SessionList


- **metadata** (<a href="{{< ref "../meta/list-meta#ListMeta" >}}">ListMeta</a>)


- **items** ([]<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>), required






## Operations {#Operations}



<hr>






### `get` read the specified Session

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/sessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Session


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): OK


### `get` read status of the specified Session

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/sessions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Session


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): OK


### `list` list or watch objects of kind Session

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/sessions

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


200 (<a href="{{< ref "../core/session-v1alpha1#SessionList" >}}">SessionList</a>): OK


### `create` create a Session

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/sessions

#### Parameters


- **body**: <a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): OK

201 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): Created

202 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): Accepted


### `update` replace the specified Session

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/sessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Session


- **body**: <a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): OK

201 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): Created


### `update` replace status of the specified Session

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/sessions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Session


- **body**: <a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): OK

201 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): Created


### `patch` partially update the specified Session

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/sessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Session


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


200 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): OK


### `patch` partially update status of the specified Session

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/sessions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Session


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


200 (<a href="{{< ref "../core/session-v1alpha1#Session" >}}">Session</a>): OK


### `delete` delete a Session

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/sessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Session


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


### `deletecollection` delete collection of Session

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/sessions

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

