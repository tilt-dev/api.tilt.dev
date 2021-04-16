---
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "Cmd"
content_type: "api_reference"
description: "Cmd."
title: "Cmd v1alpha1"
weight: 1
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## Cmd {#Cmd}

Cmd

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: Cmd


- **metadata** (<a href="{{< ref "../meta/object-meta#ObjectMeta" >}}">ObjectMeta</a>)


- **spec** (<a href="{{< ref "../core/cmd-v1alpha1#CmdSpec" >}}">CmdSpec</a>)


- **status** (<a href="{{< ref "../core/cmd-v1alpha1#CmdStatus" >}}">CmdStatus</a>)






## CmdSpec {#CmdSpec}

CmdSpec defines the desired state of Cmd

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

- **readinessProbe** (Probe)

  Periodic probe of service readiness.

  <a name="Probe"></a>
  *Probe describes a health check to be performed o determine whether it is alive or ready to receive traffic.*

  - **readinessProbe.exec** (ExecAction)

    One and only one of the following should be specified. Exec specifies the action to take.

    <a name="ExecAction"></a>
    *ExecAction describes a "run in container" action.*

  - **readinessProbe.exec.command** ([]string)

    Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

  - **readinessProbe.failureThreshold** (int32)

    Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1.

  - **readinessProbe.httpGet** (HTTPGetAction)

    HTTPGet specifies the http request to perform.

    <a name="HTTPGetAction"></a>
    *HTTPGetAction describes an action based on HTTP Get requests.*

  - **readinessProbe.httpGet.port** (int32), required

    Name or number of the port to access on the container. Number must be in the range 1 to 65535.

  - **readinessProbe.httpGet.host** (string)

    Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

  - **readinessProbe.httpGet.httpHeaders** ([]HTTPHeader)

    Custom headers to set in the request. HTTP allows repeated headers.

    <a name="HTTPHeader"></a>
    *HTTPHeader describes a custom header to be used in HTTP probes*

  - **readinessProbe.httpGet.httpHeaders.name** (string), required

    The header field name

  - **readinessProbe.httpGet.httpHeaders.value** (string), required

    The header field value

  - **readinessProbe.httpGet.path** (string)

    Path to access on the HTTP server.

  - **readinessProbe.httpGet.scheme** (string)

    Scheme to use for connecting to the host. Defaults to HTTP.

  - **readinessProbe.initialDelaySeconds** (int32)

    Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes

  - **readinessProbe.periodSeconds** (int32)

    How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.

  - **readinessProbe.successThreshold** (int32)

    Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.

  - **readinessProbe.tcpSocket** (TCPSocketAction)

    TCPSocket specifies an action involving a TCP port. TCP hooks not yet supported

    <a name="TCPSocketAction"></a>
    *TCPSocketAction describes an action based on opening a socket*

  - **readinessProbe.tcpSocket.port** (int32), required

    Number or name of the port to access on the container. Number must be in the range 1 to 65535.

  - **readinessProbe.tcpSocket.host** (string)

    Optional: Host name to connect to, defaults to the pod IP.

  - **readinessProbe.timeoutSeconds** (int32)

    Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes

- **restartOn** (RestartOnSpec)

  Indicates objects that can trigger a restart of this command.
  
  Restarts can happen even if the command is already done.
  
  Logs of the currently process after the restart are discarded.

  <a name="RestartOnSpec"></a>
  *RestartOnSpec indicates the set of objects that can trigger a restart of this object.*

  - **restartOn.fileWatches** ([]string), required

    A list of file watches that can trigger a restart.





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


- **metadata** (<a href="{{< ref "../meta/list-meta#ListMeta" >}}">ListMeta</a>)


- **items** ([]<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>), required






## Operations {#Operations}



<hr>






### `get` read the specified Cmd

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/cmds/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): OK


### `get` read status of the specified Cmd

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/cmds/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): OK


### `list` list or watch objects of kind Cmd

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/cmds

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


200 (<a href="{{< ref "../core/cmd-v1alpha1#CmdList" >}}">CmdList</a>): OK


### `create` create a Cmd

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/cmds

#### Parameters


- **body**: <a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): OK

201 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): Created

202 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): Accepted


### `update` replace the specified Cmd

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/cmds/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


- **body**: <a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): OK

201 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): Created


### `update` replace status of the specified Cmd

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/cmds/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


- **body**: <a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>, required

  


- **dryRun** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#dryRun" >}}">dryRun</a>


- **fieldManager** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#fieldManager" >}}">fieldManager</a>


- **pretty** (*in query*): string

  <a href="{{< ref "../common-parameters/common-parameters#pretty" >}}">pretty</a>



#### Response


200 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): OK

201 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): Created


### `patch` partially update the specified Cmd

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/cmds/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


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


200 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): OK


### `patch` partially update status of the specified Cmd

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/cmds/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


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


200 (<a href="{{< ref "../core/cmd-v1alpha1#Cmd" >}}">Cmd</a>): OK


### `delete` delete a Cmd

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/cmds/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the Cmd


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


### `deletecollection` delete collection of Cmd

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/cmds

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

