---
layout: api
api_metadata:
  apiVersion: ""
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "Probe"
content_type: "api_reference"
description: "Probe describes a health check to be performed to determine whether it is alive or ready to receive traffic."
title: "Probe"
weight: 8
---



`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


Probe describes a health check to be performed to determine whether it is alive or ready to receive traffic.

<hr>

- **exec** (ExecAction)

  One and only one of the following should be specified. Exec specifies the action to take.

  <a name="ExecAction"></a>
  *ExecAction describes a "run in container" action.*

  - **exec.command** ([]string)

    Command is the command line to execute inside the container, the working directory for the command  is root ('/') in the container's filesystem. The command is simply exec'd, it is not run inside a shell, so traditional shell instructions ('\|', etc) won't work. To use a shell, you need to explicitly call out to that shell. Exit status of 0 is treated as live/healthy and non-zero is unhealthy.

- **failureThreshold** (int32)

  Minimum consecutive failures for the probe to be considered failed after having succeeded. Defaults to 3. Minimum value is 1.

- **httpGet** (HTTPGetAction)

  HTTPGet specifies the http request to perform.

  <a name="HTTPGetAction"></a>
  *HTTPGetAction describes an action based on HTTP Get requests.*

  - **httpGet.port** (int32), required

    Name or number of the port to access on the container. Number must be in the range 1 to 65535.

  - **httpGet.host** (string)

    Host name to connect to, defaults to the pod IP. You probably want to set "Host" in httpHeaders instead.

  - **httpGet.httpHeaders** ([]HTTPHeader)

    Custom headers to set in the request. HTTP allows repeated headers.

    <a name="HTTPHeader"></a>
    *HTTPHeader describes a custom header to be used in HTTP probes*

  - **httpGet.httpHeaders.name** (string), required

    The header field name

  - **httpGet.httpHeaders.value** (string), required

    The header field value

  - **httpGet.path** (string)

    Path to access on the HTTP server.

  - **httpGet.scheme** (string)

    Scheme to use for connecting to the host. Defaults to HTTP.

- **initialDelaySeconds** (int32)

  Number of seconds after the container has started before liveness probes are initiated. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes

- **periodSeconds** (int32)

  How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.

- **successThreshold** (int32)

  Minimum consecutive successes for the probe to be considered successful after having failed. Defaults to 1. Must be 1 for liveness and startup. Minimum value is 1.

- **tcpSocket** (TCPSocketAction)

  TCPSocket specifies an action involving a TCP port. TCP hooks not yet supported

  <a name="TCPSocketAction"></a>
  *TCPSocketAction describes an action based on opening a socket*

  - **tcpSocket.port** (int32), required

    Number or name of the port to access on the container. Number must be in the range 1 to 65535.

  - **tcpSocket.host** (string)

    Optional: Host name to connect to, defaults to the pod IP.

- **timeoutSeconds** (int32)

  Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle#container-probes





