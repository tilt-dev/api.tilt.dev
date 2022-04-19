---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "DockerComposeService"
content_type: "api_reference"
description: "DockerComposeService represents a container orchestrated by Docker Compose."
title: "DockerComposeService v1alpha1"
weight: 1
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## DockerComposeService {#DockerComposeService}


DockerComposeService represents a container orchestrated by Docker Compose.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: DockerComposeService


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([DockerComposeServiceSpec](../docker-compose/docker-compose-service-v1alpha1#DockerComposeServiceSpec))


- **status** ([DockerComposeServiceStatus](../docker-compose/docker-compose-service-v1alpha1#DockerComposeServiceStatus))






## DockerComposeServiceSpec {#DockerComposeServiceSpec}


DockerComposeServiceSpec defines the desired state a Docker Compose container.

<hr>

- **project** (DockerComposeProject), required

  A specification of the project the service belongs to.
  
  Each service spec keeps its own copy of the project spec.

  <a name="DockerComposeProject"></a>
  **

  - **project.configPaths** ([]string)

    Configuration files to load.
    
    If both ConfigPaths and ProjectPath/YAML are specified, the YAML is the source of truth, and the ConfigPaths are used to print diagnostic information.

  - **project.envFile** (string)

    Path to an env file to use. Passed to docker-compose as `--env-file FILE`.

  - **project.name** (string)

    The docker-compose project name.
    
    If omitted, the default is to use the NormalizedName of the ProjectPath base name.

  - **project.projectPath** (string)

    The base path of the docker-compose project.
    
    Expressed in docker-compose as --project-directory.
    
    When used on the command-line, the Docker Compose spec mandates that this must be the directory of the first yaml file.  All additional yaml files are evaluated relative to this project path.

  - **project.yaml** (string)

    The docker-compose config YAML.
    
    Usually contains multiple services.
    
    If you have multiple docker-compose.yaml files, you can combine them into a single YAML with `docker-compose -f file1.yaml -f file2.yaml config`.

- **service** (string), required

  The name of the service to create.

- **disableSource** (DisableSource)

  Specifies how to disable this.

  <a name="DisableSource"></a>
  *Points at a thing that can control whether something is disabled*

  - **disableSource.configMap** (ConfigMapDisableSource)

    Disabled by single ConfigMap value.

    <a name="ConfigMapDisableSource"></a>
    *Specifies a ConfigMap to control a DisableSource*

  - **disableSource.configMap.key** (string), required

    The key where the enable/disable state is stored.

  - **disableSource.configMap.name** (string), required

    The name of the ConfigMap

  - **disableSource.everyConfigMap** ([]ConfigMapDisableSource)

    Disabled by multiple ConfigMap values, which must all be set to disabled to disable the object.

    <a name="ConfigMapDisableSource"></a>
    *Specifies a ConfigMap to control a DisableSource*

  - **disableSource.everyConfigMap.key** (string), required

    The key where the enable/disable state is stored.

  - **disableSource.everyConfigMap.name** (string), required

    The name of the ConfigMap

- **imageMaps** ([]string)

  The image maps that this deploy depends on.





## DockerComposeServiceStatus {#DockerComposeServiceStatus}


DockerComposeServiceStatus defines the observed state of DockerComposeService, continuing to watch the container after it starts.

<hr>

- **applyError** (string)

  An error bringing up the container.

- **containerID** (string)

  Current container ID.

- **containerName** (string)

  Current container name.

- **containerState** (DockerContainerState)

  Current state of the container for this service.

  <a name="DockerContainerState"></a>
  *State of a standalone container in Docker.
  
  An apiserver-compatible representation of this struct: https://pkg.go.dev/github.com/docker/docker/api/types#ContainerState*

  - **containerState.error** (string)

    Whether the container is in an error state.

  - **containerState.exitCode** (int32)

    The exit code, if the container has exited.

  - **containerState.finishedAt** (MicroTime)

    When the container process finished.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **containerState.running** (boolean)

    Whether the container is running.

  - **containerState.startedAt** (MicroTime)

    When the container process started.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **containerState.status** (string)

    String representation of the container state. Can be one of "created", "running", "paused", "restarting", "removing", "exited", or "dead".

- **disableStatus** (DisableStatus)

  Details about whether/why this is disabled.

  <a name="DisableStatus"></a>
  **

  - **disableStatus.disabled** (boolean), required

    Whether this is currently disabled. Deprecated in favor of `State`.

  - **disableStatus.lastUpdateTime** (Time), required

    The last time this status was updated.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **disableStatus.reason** (string), required

    The reason this status was updated.

  - **disableStatus.state** (string), required

    Whether this is currently disabled (if known)

- **lastApplyFinishTime** (MicroTime)

  Timestamp of when we last finished bringing up this service in Docker Compose.
  
  When populated, must be equal or after the LastApplyStartTime field.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **lastApplyStartTime** (MicroTime)

  Timestamp of when we last started bringing up this service in Docker Compose.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **portBindings** ([]DockerPortBinding)

  How docker binds container ports to the host network for this service.

  <a name="DockerPortBinding"></a>
  *How docker binds container ports to the host network*

  - **portBindings.containerPort** (int32)

    The port inside the container.

  - **portBindings.hostIP** (string)

    The IP on the host machine where Docker is binding the network.

  - **portBindings.hostPort** (int32)

    The port on the host machine where Docker running.





## DockerComposeServiceList {#DockerComposeServiceList}


DockerComposeServiceList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: DockerComposeServiceList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][DockerComposeService](../docker-compose/docker-compose-service-v1alpha1#DockerComposeService)), required









<hr>



