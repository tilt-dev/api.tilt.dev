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

- **defaultRegistry** (RegistryHosting)

  DefaultRegistry determines where images for this Cluster should be pushed/pulled from if the Cluster itself does not provide local registry hosting metadata.
  
  If not specified, no registry rewriting will occur, and the images will be pushed/pulled to from the registry specified by the corresponding image build directive (e.g. `docker_build` or `custom_build`).

  <a name="RegistryHosting"></a>
  **

  - **defaultRegistry.help** (string)

    Help contains a URL pointing to documentation for users on how to set up and configure a local registry.
    
    Tools can use this to nudge users to enable the registry. When possible, the writer should use as permanent a URL as possible to prevent drift (e.g., a version control SHA).
    
    When image pushes to a registry host specified in one of the other fields fail, the tool should display this help URL to the user. The help URL should contain instructions on how to diagnose broken or misconfigured registries.

  - **defaultRegistry.host** (string)

    Host documents the host (hostname and port) of the registry, as seen from outside the cluster.
    
    This is the registry host that tools outside the cluster should push images to.

  - **defaultRegistry.hostFromClusterNetwork** (string)

    HostFromClusterNetwork documents the host (hostname and port) of the registry, as seen from networking inside the container pods.
    
    This is the registry host that tools running on pods inside the cluster should push images to. If not set, then tools inside the cluster should assume the local registry is not available to them.

  - **defaultRegistry.hostFromContainerRuntime** (string)

    HostFromContainerRuntime documents the host (hostname and port) of the registry, as seen from the cluster's container runtime.
    
    When tools apply Kubernetes objects to the cluster, this host should be used for image name fields. If not set, users of this field should use the value of Host instead.
    
    Note that it doesn't make sense semantically to define this field, but not define Host or HostFromClusterNetwork. That would imply a way to pull images without a way to push images.

  - **defaultRegistry.singleName** (string)

    SingleName uses a shared image name for _all_ Tilt-built images and relies on tags to distinguish between logically distinct images.
    
    This is most commonly used with Amazon Elastic Container Registry (ECR), which works differently than other image registries.
    
    An ECR host takes the form https://aws_account_id.dkr.ecr.region.amazonaws.com. Each image name in that registry must be pre-created ಠ_ಠ and assigned IAM permissions. For example: https://aws_account_id.dkr.ecr.region.amazonaws.com/my-repo (They call this a repo).
    
    For this reason, some users using ECR prefer to push all images to a single image name (ECR repo).
    
    A recommended pattern here is to create a "personal" image repo for each user during development.
    
    See: https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html https://github.com/tilt-dev/tilt/issues/2419





## ClusterStatus {#ClusterStatus}


ClusterStatus defines the observed state of Cluster

<hr>

- **arch** (string)

  The preferred chip architecture of the cluster.
  
  On Kubernetes, this will correspond to the kubernetes.io/arch annotation on a node.
  
  On Docker, this will be the Architecture of the Docker daemon.
  
  Note that many clusters support multiple chipsets. This field doesn't intend that this is the only architecture a cluster supports, only that it's one of the architectures.

- **connectedAt** (MicroTime)

  ConnectedAt indicates the time at which the cluster connection was established.
  
  Consumers can use this to detect when the underlying config has changed and refresh their client/connection accordingly.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **connection** (ClusterConnectionStatus)

  Connection status for an existing cluster.

  <a name="ClusterConnectionStatus"></a>
  *Connection spec for an existing cluster.*

  - **connection.kubernetes** (KubernetesClusterConnectionStatus)

    Defines connection to a Kubernetes cluster.

    <a name="KubernetesClusterConnectionStatus"></a>
    *Kubernetes-specific fields for connection status*

  - **connection.kubernetes.cluster** (string), required

    The resolved cluster name (as determined by the kubeconfig context).

  - **connection.kubernetes.context** (string), required

    The resolved kubeconfig context.

  - **connection.kubernetes.namespace** (string), required

    The resolved default namespace.

  - **connection.kubernetes.product** (string)

    The product name for this cluster.
    
    For a complete list of possible product names, see: https://pkg.go.dev/github.com/tilt-dev/clusterid#Product

- **error** (string)

  An unrecoverable error connecting to the cluster.

- **registry** (RegistryHosting)

  Registry describes a local registry that developer tools can connect to. A local registry allows clients to load images into the local cluster by pushing to this registry.

  <a name="RegistryHosting"></a>
  **

  - **registry.help** (string)

    Help contains a URL pointing to documentation for users on how to set up and configure a local registry.
    
    Tools can use this to nudge users to enable the registry. When possible, the writer should use as permanent a URL as possible to prevent drift (e.g., a version control SHA).
    
    When image pushes to a registry host specified in one of the other fields fail, the tool should display this help URL to the user. The help URL should contain instructions on how to diagnose broken or misconfigured registries.

  - **registry.host** (string)

    Host documents the host (hostname and port) of the registry, as seen from outside the cluster.
    
    This is the registry host that tools outside the cluster should push images to.

  - **registry.hostFromClusterNetwork** (string)

    HostFromClusterNetwork documents the host (hostname and port) of the registry, as seen from networking inside the container pods.
    
    This is the registry host that tools running on pods inside the cluster should push images to. If not set, then tools inside the cluster should assume the local registry is not available to them.

  - **registry.hostFromContainerRuntime** (string)

    HostFromContainerRuntime documents the host (hostname and port) of the registry, as seen from the cluster's container runtime.
    
    When tools apply Kubernetes objects to the cluster, this host should be used for image name fields. If not set, users of this field should use the value of Host instead.
    
    Note that it doesn't make sense semantically to define this field, but not define Host or HostFromClusterNetwork. That would imply a way to pull images without a way to push images.

  - **registry.singleName** (string)

    SingleName uses a shared image name for _all_ Tilt-built images and relies on tags to distinguish between logically distinct images.
    
    This is most commonly used with Amazon Elastic Container Registry (ECR), which works differently than other image registries.
    
    An ECR host takes the form https://aws_account_id.dkr.ecr.region.amazonaws.com. Each image name in that registry must be pre-created ಠ_ಠ and assigned IAM permissions. For example: https://aws_account_id.dkr.ecr.region.amazonaws.com/my-repo (They call this a repo).
    
    For this reason, some users using ECR prefer to push all images to a single image name (ECR repo).
    
    A recommended pattern here is to create a "personal" image repo for each user during development.
    
    See: https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html https://github.com/tilt-dev/tilt/issues/2419

- **version** (string)

  Version is a cluster-provided, human-readable version string.





## ClusterList {#ClusterList}


ClusterList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ClusterList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][Cluster](../kubernetes/cluster-v1alpha1#Cluster)), required









<hr>



