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

- **disableSource** (DisableSource)

  Specifies how to disable this.

  <a name="DisableSource"></a>
  *Points at a thing that can control whether something is disabled*

  - **disableSource.configMap** (ConfigMapDisableSource)

    This DisableSource is controlled by a ConfigMap

    <a name="ConfigMapDisableSource"></a>
    *Specifies a ConfigMap to control a DisableSource*

  - **disableSource.configMap.key** (string), required

    The key where the enable/disable state is stored.

  - **disableSource.configMap.name** (string), required

    The name of the ConfigMap

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

  - **restartOn.fileWatches** ([]string)

    FileWatches that can trigger a restart.

  - **restartOn.uiButtons** ([]string)

    UIButtons that can trigger a restart.

- **startOn** (StartOnSpec)

  Indicates objects that can trigger a start/restart of this command.
  
  Restarts behave the same as RestartOn. The key difference is that a Cmd with any StartOn triggers will not have its command run until its StartOn is satisfied.

  <a name="StartOnSpec"></a>
  *StartOnSpec indicates the set of objects that can trigger a start/restart of this object.*

  - **startOn.uiButtons** ([]string), required

    UIButtons that can trigger a start/restart.

  - **startOn.startAfter** (Time)

    StartAfter indicates that events before this time should be ignored.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*





## CmdStatus {#CmdStatus}


CmdStatus defines the observed state of Cmd

Based loosely on ContainerStatus in Kubernetes

<hr>

- **disableStatus** (DisableStatus)

  Details about whether/why this is disabled.

  <a name="DisableStatus"></a>
  **

  - **disableStatus.disabled** (boolean), required

    Whether this is currently disabled.

  - **disableStatus.lastUpdateTime** (Time), required

    The last time this status was updated.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **disableStatus.reason** (string), required

    The reason this status was updated.

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









<hr>



