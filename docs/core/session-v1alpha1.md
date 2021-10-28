---
layout: api
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


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([SessionSpec](../core/session-v1alpha1#SessionSpec))


- **status** ([SessionStatus](../core/session-v1alpha1#SessionStatus))






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


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][Session](../core/session-v1alpha1#Session)), required






## Operations {#Operations}



<hr>






### `get` read the specified Session

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/sessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Session


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Session](../core/session-v1alpha1#Session)): OK


### `get` read status of the specified Session

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/sessions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Session


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Session](../core/session-v1alpha1#Session)): OK


### `list` list or watch objects of kind Session

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/sessions

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


200 ([SessionList](../core/session-v1alpha1#SessionList)): OK


### `create` create a Session

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/sessions

#### Parameters


- **body**: [Session](../core/session-v1alpha1#Session), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Session](../core/session-v1alpha1#Session)): OK

201 ([Session](../core/session-v1alpha1#Session)): Created

202 ([Session](../core/session-v1alpha1#Session)): Accepted


### `update` replace the specified Session

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/sessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Session


- **body**: [Session](../core/session-v1alpha1#Session), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Session](../core/session-v1alpha1#Session)): OK

201 ([Session](../core/session-v1alpha1#Session)): Created


### `update` replace status of the specified Session

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/sessions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Session


- **body**: [Session](../core/session-v1alpha1#Session), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Session](../core/session-v1alpha1#Session)): OK

201 ([Session](../core/session-v1alpha1#Session)): Created


### `patch` partially update the specified Session

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/sessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Session


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


200 ([Session](../core/session-v1alpha1#Session)): OK

201 ([Session](../core/session-v1alpha1#Session)): Created


### `patch` partially update status of the specified Session

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/sessions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Session


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


200 ([Session](../core/session-v1alpha1#Session)): OK

201 ([Session](../core/session-v1alpha1#Session)): Created


### `delete` delete a Session

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/sessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Session


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


### `deletecollection` delete collection of Session

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/sessions

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

