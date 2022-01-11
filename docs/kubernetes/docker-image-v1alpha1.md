---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "DockerImage"
content_type: "api_reference"
description: "DockerImage describes an image to build with Docker."
title: "DockerImage v1alpha1"
weight: 3
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## DockerImage {#DockerImage}


DockerImage describes an image to build with Docker.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: DockerImage


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([DockerImageSpec](../kubernetes/docker-image-v1alpha1#DockerImageSpec))


- **status** ([DockerImageStatus](../kubernetes/docker-image-v1alpha1#DockerImageStatus))






## DockerImageSpec {#DockerImageSpec}


DockerImageSpec describes how to build a Docker image with `docker_build`.

Most fields of this spec directly correspond to the Docker CLI.

<hr>

- **ref** (string), required

  The named reference of the image.

- **args** ([]string)

  Args specifies the build arguments to the Dockerfile.
  
  Equivalent to `--build-arg` in the docker CLI.
  
  Each item should take the form "KEY" or "KEY=VALUE".

- **cacheFrom** ([]string)

  Images to use as cache sources.
  
  Equivalent to `--cache-from` in the Docker CLI.

- **context** (string)

  Context specifies the Docker build context.
  
  Must be an absolute path on the local filesystem.

- **dockerfileContents** (string)

  Dockerfile contains the complete contents of the Dockerfile.

- **extraTags** ([]string)

  By default, Tilt creates a new temporary image reference for each build. The user can also specify their own reference, to integrate with other tooling (like build IDs for Jenkins build pipelines)
  
  Equivalent to the docker build --tag flag.

- **imageMaps** ([]string)

  Names of image maps that this build depends on.
  
  The controller will watch all the image maps, rebuild the image if any of the maps resolve to a new image, and inject them into the dockerfile.

- **network** (string)

  Set the networking mode for the RUN instructions in the docker build.
  
  Equivalent to `--network` in the Docker CLI.

- **platform** (string)

  Platform specifies architecture information for target image.
  
  https://docs.docker.com/desktop/multi-arch/
  
  Equivalent to `--platform` in the Docker CLI.

- **pull** (boolean)

  Always attempt to pull a new version of the base image.
  
  Equivalent to `--pull` in the Docker CLI.

- **secrets** ([]string)

  Pass secrets to docker.
  
  https://docs.docker.com/develop/develop-images/build_enhancements/#new-docker-build-secret-information
  
  Equivalent to `--secret` in the Docker CLI.

- **sshAgentConfigs** ([]string)

  Pass SSH secrets to docker so it can clone private repos.
  
  https://docs.docker.com/develop/develop-images/build_enhancements/#using-ssh-to-access-private-data-in-builds
  
  Equivalent to `--ssh` in the docker CLI.

- **target** (string)

  Target specifies the name of the stage in the Dockerfile to build.
  
  Equivalent to `--target` in the docker CLI.





## DockerImageStatus {#DockerImageStatus}


DockerImageStatus defines the observed state of DockerImage

<hr>

- **building** (DockerImageStateBuilding)

  Details about a building image.

  <a name="DockerImageStateBuilding"></a>
  *DockerImageStateBuilding expresses that an image build is in-progress.*

  - **building.reason** (string)

    The reason why the image is building.

  - **building.startedAt** (MicroTime)

    Time when the build started.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **completed** (DockerImageStateCompleted)

  Details about a finished image build.

  <a name="DockerImageStateCompleted"></a>
  *DockerImageStateCompleted expresses when the image build is finished and no new images need to be built.*

  - **completed.error** (string)

    Error message if the build failed.

  - **completed.finishedAt** (MicroTime)

    Time when we finished building an image

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **completed.reason** (string)

    The reason why the image was built.

  - **completed.startedAt** (MicroTime)

    Time when we started building an image.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **ref** (string)

  A fully-qualified image reference of a built image, as seen from the local network.
  
  Usually includes a name and an immutable tag.
  
  NB: If we're building to a particular registry, this may have a different hostname from the Spec `Ref` field.

- **stageStatuses** ([]DockerImageStageStatus)

  Status information about each individual build stage of the most recent image build.

  <a name="DockerImageStageStatus"></a>
  *DockerImageStageStatus gives detailed report of each stage of the most recent image build.
  
  Most stages are derived from Buildkit's StatusResponse https://github.com/moby/buildkit/blob/35fcb28a009d6454b2915a5c8084b25ad851cf38/api/services/control/control.proto#L108 but Tilt may synthesize its own stages for the steps it owns.
  
  Stages may be executed in parallel.*

  - **stageStatuses.name** (string), required

    A human-readable name of the stage.

  - **stageStatuses.cached** (boolean)

    Whether Buildkit was able to cache the stage based on inputs.

  - **stageStatuses.error** (string)

    Error message if the stage failed. If empty, the stage succeeded.

  - **stageStatuses.finishedAt** (MicroTime)

    The timetsamp when we completed the work on the stage.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

  - **stageStatuses.startedAt** (MicroTime)

    The timestamp when we started working on the stage.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **waiting** (DockerImageStateWaiting)

  Details about a waiting image build.

  <a name="DockerImageStateWaiting"></a>
  *DockerImageStateWaiting expresses what we're waiting on to build an image.*

  - **waiting.reason** (string)

    (brief) reason the image build is waiting.





## DockerImageList {#DockerImageList}


DockerImageList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: DockerImageList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][DockerImage](../kubernetes/docker-image-v1alpha1#DockerImage)), required









<hr>



