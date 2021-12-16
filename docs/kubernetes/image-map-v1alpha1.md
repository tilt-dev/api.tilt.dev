---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "ImageMap"
content_type: "api_reference"
description: "ImageMap expresses the mapping from an image reference to a real, pushed image in an image registry that a container runtime can access."
title: "ImageMap v1alpha1"
weight: 4
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## ImageMap {#ImageMap}


ImageMap expresses the mapping from an image reference to a real, pushed image in an image registry that a container runtime can access.

Another way to think about the ImageMap is that ImageMapSpec is a mutable image reference (where the image might not exist yet), but ImageMapStatus is an immutable image reference (where, if an image is specified, it always exists).

ImageMap does not specify how the image is built or who is responsible for building this. But any API that builds images should produce an ImageMap.

For example, a builder that builds to a local image registry might create a map from: 'my-apiserver:dev' to 'localhost:5000/my-apiserver:content-based-label'.

ImageMap doesn't follow the usual Kubernetes-style API semantics (where the Status is the result of running the Spec). It's closer to a ConfigMap. Though the Status does represent a real runtime result (an image in a registry).

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ImageMap


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([ImageMapSpec](../kubernetes/image-map-v1alpha1#ImageMapSpec))


- **status** ([ImageMapStatus](../kubernetes/image-map-v1alpha1#ImageMapStatus))






## ImageMapSpec {#ImageMapSpec}


ImageMapSpec defines the desired state of ImageMap

<hr>

- **selector** (string), required

  A named image reference.
  
  Deployment tools expect this image reference to match an image in the YAML being deployed, and will replace that image reference.
  
  By default, this selector will match an image if the names match (tags on both the selector and the matched reference are ignored).

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

- **matchExact** (boolean)

  If specified, then tags on both the selector and the matched reference are used for matching. The selector will only match the reference if the tags match exactly.

- **matchInEnvVars** (boolean)

  If specified, then the selector will also match any strings in container env variables.

- **overrideArgs** (ImageMapOverrideArgs)

  If specified, the injector will replace the 'args' field in the container when it replaces the image.

  <a name="ImageMapOverrideArgs"></a>
  *ImageMapArgsOverride defines args to inject when the image is injected. Only applies to types that embed a v1.Container with a Command field.
  
  https://pkg.go.dev/k8s.io/api/core/v1#Container*

  - **overrideArgs.args** ([]string), required

    A list of args strings.

- **overrideCommand** (ImageMapOverrideCommand)

  If specified, the injector will replace the 'command' field in the container when it replaces the image.

  <a name="ImageMapOverrideCommand"></a>
  *ImageMapCommandOverride defines a command to inject when the image is injected. Only applies to types that embed a v1.Container with a Command field.
  
  https://pkg.go.dev/k8s.io/api/core/v1#Container*

  - **overrideCommand.command** ([]string), required

    A list of command strings.





## ImageMapStatus {#ImageMapStatus}


ImageMapStatus defines the observed state of ImageMap

<hr>

- **image** (string), required

  A fully-qualified image reference, including a name and an immutable tag, as seen from the cluster container runtime that we're mapping this image to.
  
  NB: Container images often need to be referenced from different networks, including:
  
  1) The cluster container runtime 2) The local network 3) The cluster network
  
  And each of these cases may have distinct URLs.
  
  For more details on image references in different networks, see: https://github.com/kubernetes/enhancements/tree/master/keps/sig-cluster-lifecycle/generic/1755-communicating-a-local-registry#specification-for-localregistryhosting-v1

- **buildStartTime** (MicroTime)

  Timestamp indicating when the image started building.
  
  Intended to be used to determine which file changes were picked up by the image build. We can assume that any file changes before this timestamp were definitely included in the image, and any file changes after this timestamp may not be included in the image.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*





## ImageMapList {#ImageMapList}


ImageMapList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ImageMapList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][ImageMap](../kubernetes/image-map-v1alpha1#ImageMap)), required









<hr>



