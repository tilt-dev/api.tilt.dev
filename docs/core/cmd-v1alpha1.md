---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "Cmd"
content_type: "api_reference"
description: "Cmd represents a process on the host machine."
title: "Cmd v1alpha1"
weight: 1
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## Cmd {#Cmd}

Cmd represents a process on the host machine.

When the process exits, we will make a best-effort attempt (within OS limitations) to kill any spawned descendant processes.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: Cmd


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([CmdSpec](../core/cmd-v1alpha1#CmdSpec))


- **status** ([CmdStatus](../core/cmd-v1alpha1#CmdStatus))






## CmdSpec {#CmdSpec}

CmdSpec defines how to run a local command.

<hr>

- **args** ([]string)

  Command-line arguments. Must have length at least 1.

- **dir** (string)

  Process working directory.
  
  If the working directory is not specified, the command is run in the default Tilt working directory.

- **env** ([]string)

  Additional variables process environment.
  
  Expressed as a C-style array of strings of the form ["KEY1=VALUE1", "KEY2=VALUE2", ...].
  
  Environment variables are layered on top of the environment variables that Tilt runs with.

- **readinessProbe** ([Probe](../core/probe#Probe))

  Periodic probe of service readiness.

- **restartOn** (RestartOnSpec)

  Indicates objects that can trigger a restart of this command.
  
  When a restart is triggered, Tilt will try to gracefully shutdown any currently running process, waiting for it to exit before starting a new process. If the process doesn't shutdown within the allotted time, Tilt will kill the process abruptly.
  
  Restarts can happen even if the command is already done.
  
  Logs of the current process after the restart are discarded.

  <a name="RestartOnSpec"></a>
  *RestartOnSpec indicates the set of objects that can trigger a restart of this object.*

  - **restartOn.fileWatches** ([]string), required

    A list of file watches that can trigger a restart.

- **startOn** (StartOnSpec)

  Indicates objects that can trigger a start/restart of this command.
  
  Restarts behave the same as RestartOn. The key difference is that a Cmd with any StartOn triggers will not have its command run until its StartOn is satisfied.

  <a name="StartOnSpec"></a>
  *StartOnSpec indicates the set of objects that can trigger a start/restart of this object.*

  - **startOn.uiButtons** ([]string), required

    A list of ui buttons that can trigger a run.

  - **startOn.startAfter** (Time)

    Any events that predate this time will be ignored.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*





## CmdStatus {#CmdStatus}

CmdStatus defines the observed state of Cmd

Based loosely on ContainerStatus in Kubernetes

<hr>

- **ready** (boolean)

  Specifies whether the command has passed its readiness probe.
  
  Terminating the command does not change its Ready state.
  
  Is always true when no readiness probe is defined.

- **running** (CmdStateRunning)

  Details about a running process.

  <a name="CmdStateRunning"></a>
  *CmdStateRunning is a running state of a local command.*

  - **running.pid** (int32), required

    The process id of the command.

  - **running.startedAt** (MicroTime)

    Time at which the command was last started.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **terminated** (CmdStateTerminated)

  Details about a terminated process.

  <a name="CmdStateTerminated"></a>
  *CmdStateTerminated is a terminated state of a local command.*

  - **terminated.exitCode** (int32), required

    Exit status from the last termination of the command

  - **terminated.pid** (int32), required

    The process id of the command.

  - **terminated.finishedAt** (MicroTime)

    Time at which the command last terminated

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **terminated.reason** (string)

    (brief) reason the process is terminated

  - **terminated.startedAt** (MicroTime)

    Time at which previous execution of the command started

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **waiting** (CmdStateWaiting)

  Details about a waiting process.

  <a name="CmdStateWaiting"></a>
  *CmdStateWaiting is a waiting state of a local command.*

  - **waiting.reason** (string)

    (brief) reason the process is not yet running.





## CmdList {#CmdList}

CmdList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: CmdList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][Cmd](../core/cmd-v1alpha1#Cmd)), required






## Operations {#Operations}



<hr>






### `get` read the specified Cmd

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/cmds/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Cmd](../core/cmd-v1alpha1#Cmd)): OK


### `get` read status of the specified Cmd

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/cmds/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Cmd](../core/cmd-v1alpha1#Cmd)): OK


### `list` list or watch objects of kind Cmd

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/cmds

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


200 ([CmdList](../core/cmd-v1alpha1#CmdList)): OK


### `create` create a Cmd

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/cmds

#### Parameters


- **body**: [Cmd](../core/cmd-v1alpha1#Cmd), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Cmd](../core/cmd-v1alpha1#Cmd)): OK

201 ([Cmd](../core/cmd-v1alpha1#Cmd)): Created

202 ([Cmd](../core/cmd-v1alpha1#Cmd)): Accepted


### `update` replace the specified Cmd

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/cmds/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


- **body**: [Cmd](../core/cmd-v1alpha1#Cmd), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Cmd](../core/cmd-v1alpha1#Cmd)): OK

201 ([Cmd](../core/cmd-v1alpha1#Cmd)): Created


### `update` replace status of the specified Cmd

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/cmds/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


- **body**: [Cmd](../core/cmd-v1alpha1#Cmd), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([Cmd](../core/cmd-v1alpha1#Cmd)): OK

201 ([Cmd](../core/cmd-v1alpha1#Cmd)): Created


### `patch` partially update the specified Cmd

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/cmds/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


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


200 ([Cmd](../core/cmd-v1alpha1#Cmd)): OK


### `patch` partially update status of the specified Cmd

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/cmds/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


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


200 ([Cmd](../core/cmd-v1alpha1#Cmd)): OK


### `delete` delete a Cmd

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/cmds/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


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


### `deletecollection` delete collection of Cmd

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/cmds

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

