---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "CmdImage"
content_type: "api_reference"
description: "CmdImage describes an image to build with an arbitrary shell command."
title: "CmdImage v1alpha1"
weight: 2
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## CmdImage {#CmdImage}


CmdImage describes an image to build with an arbitrary shell command.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: CmdImage


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([CmdImageSpec](../kubernetes/cmd-image-v1alpha1#CmdImageSpec))


- **status** ([CmdImageStatus](../kubernetes/cmd-image-v1alpha1#CmdImageStatus))






## CmdImageSpec {#CmdImageSpec}


CmdImageSpec describes how the custom script builds images and where it puts them.

<hr>

- **ref** (string), required

  The named reference of the image.

- **args** ([]string)

  Command-line arguments. Must have length at least 1.

- **dir** (string)

  Process working directory.
  
  If the working directory is not specified, the command is run in the default Tilt working directory.

- **imageMaps** ([]string)

  Names of image maps that this build depends on.
  
  The controller will watch all the image maps, and rebuild the image if any of the maps resolve to a new image.

- **outputMode** (string)

  Specifies where the image is built. If not specified, we assume the image was built to the local Docker image store.

- **outputTag** (string)

  Tag we expect the image to be built with (we use this to check that the expected image+tag has been created).
  
  If empty, we create an expected tag at the beginning of CustomBuild (and export $EXPECTED_REF=name:expected_tag )

- **outputsImageRefTo** (string)

  Specifies a filepath where the cmd script prints the result image ref.
  
  Tilt will read it out when we're done to find the image.





## CmdImageStatus {#CmdImageStatus}


CmdImageStatus describes the result of the image build.

<hr>

- **building** (CmdImageStateBuilding)

  Details about a building image.

  <a name="CmdImageStateBuilding"></a>
  *CmdImageStateBuilding expresses that an image build is in-progress.*

  - **building.reason** (string)

    The reason why the image is building.

  - **building.startedAt** (MicroTime)

    Time when the build started.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **completed** (CmdImageStateCompleted)

  Details about a finished image build.

  <a name="CmdImageStateCompleted"></a>
  *CmdImageStateCompleted expresses when the image build is finished and no new images need to be built.*

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

- **waiting** (CmdImageStateWaiting)

  Details about a waiting image build.

  <a name="CmdImageStateWaiting"></a>
  *CmdImageStateWaiting expresses what we're waiting on to build an image.*

  - **waiting.reason** (string)

    (brief) reason the image build is waiting.





## CmdImageList {#CmdImageList}


CmdImageList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: CmdImageList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][CmdImage](../kubernetes/cmd-image-v1alpha1#CmdImage)), required









<hr>



