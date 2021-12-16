---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "Cluster"
content_type: "api_reference"
description: "Cluster defines any runtime for running containers, in the broadest sense of the word \"runtime\"."
title: "Cluster v1alpha1"
weight: 1
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## Cluster {#Cluster}


Cluster defines any runtime for running containers, in the broadest sense of the word "runtime".

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: Cluster


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([ClusterSpec](../kubernetes/cluster-v1alpha1#ClusterSpec))


- **status** ([ClusterStatus](../kubernetes/cluster-v1alpha1#ClusterStatus))






## ClusterSpec {#ClusterSpec}


ClusterSpec defines how to find the cluster we're running containers on.

Tilt currently supports connecting to an existing Kubernetes cluster or an existing Docker Daemon (for Docker Compose).

<hr>

- **connection** (ClusterConnection)

  Connection spec for an existing cluster.

  <a name="ClusterConnection"></a>
  *Connection spec for an existing cluster.*

  - **connection.docker** (DockerClusterConnection)

    Defines connection to a Docker daemon.

    <a name="DockerClusterConnection"></a>
    **

  - **connection.docker.host** (string)

    The docker host to use.
    
    If not specified, will read the DOCKER_HOST env or use the default docker host.

  - **connection.kubernetes** (KubernetesClusterConnection)

    Defines connection to a Kubernetes cluster.

    <a name="KubernetesClusterConnection"></a>
    **

  - **connection.kubernetes.context** (string)

    The name of the kubeconfig context to use.
    
    If not specified, will use the default context in the kubeconfig.

  - **connection.kubernetes.namespace** (string)

    The default namespace to use.
    
    If not specified, will use the namespace in the kubeconfig.





## ClusterStatus {#ClusterStatus}


ClusterStatus defines the observed state of Cluster

<hr>

- **arch** (string)

  The preferred chip architecture of the cluster.
  
  On Kubernetes, this will correspond to the kubernetes.io/arch annotation on a node.
  
  On Docker, this will be the Architecture of the Docker daemon.
  
  Note that many clusters support multiple chipsets. This field doesn't intend that this is the only architecture a cluster supports, only that it's one of the architectures.

- **error** (string)

  An unrecoverable error connecting to the cluster.





## ClusterList {#ClusterList}


ClusterList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ClusterList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][Cluster](../kubernetes/cluster-v1alpha1#Cluster)), required









<hr>



