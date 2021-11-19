---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "KubernetesApply"
content_type: "api_reference"
description: "KubernetesApply specifies a blob of YAML to apply, and a set of ImageMaps that the YAML depends on."
title: "KubernetesApply v1alpha1"
weight: 4
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## KubernetesApply {#KubernetesApply}


KubernetesApply specifies a blob of YAML to apply, and a set of ImageMaps that the YAML depends on.

The KubernetesApply controller will resolve the ImageMaps into immutable image references. The controller will process the spec YAML, then apply it to the cluster. Those processing steps might include:

- Injecting the resolved image references. - Adding custom labels so that Tilt can track the progress of the apply. - Modifying image pull rules to ensure the image is pulled correctly.

The controller won't apply anything until all ImageMaps resolve to real images.

The controller will watch all the image maps, and redeploy the entire YAML if any of the maps resolve to a new image.

The status field will contain both the raw applied object, and derived fields to help other controllers figure out how to watch the apply progress.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: KubernetesApply


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([KubernetesApplySpec](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApplySpec))


- **status** ([KubernetesApplyStatus](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApplyStatus))






## KubernetesApplySpec {#KubernetesApplySpec}


KubernetesApplySpec defines the desired state of KubernetesApply

<hr>

- **applyCmd** (KubernetesApplyCmd)

  ApplyCmd is a custom command to execute to deploy entities to the Kubernetes cluster.
  
  The command must be idempotent, e.g. it must not fail if some or all entities already exist.
  
  The ApplyCmd MUST return valid Kubernetes YAML for the entities it applied to the cluster.
  
  Exactly one of YAML OR ApplyCmd MUST be provided.

  <a name="KubernetesApplyCmd"></a>
  **

  - **applyCmd.args** ([]string), required

    Args are the command-line arguments for the apply command. Must have length >= 1.

  - **applyCmd.dir** (string)

    Process working directory.
    
    If not specified, will default to Tilt working directory.

  - **applyCmd.env** ([]string)

    Env are additional variables for the process environment.
    
    Environment variables are layered on top of the environment variables that Tilt runs with.

- **deleteCmd** (KubernetesApplyCmd)

  DeleteCmd is a custom command to execute to delete entities created by ApplyCmd and clean up any additional state.

  <a name="KubernetesApplyCmd"></a>
  **

  - **deleteCmd.args** ([]string), required

    Args are the command-line arguments for the apply command. Must have length >= 1.

  - **deleteCmd.dir** (string)

    Process working directory.
    
    If not specified, will default to Tilt working directory.

  - **deleteCmd.env** ([]string)

    Env are additional variables for the process environment.
    
    Environment variables are layered on top of the environment variables that Tilt runs with.

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

- **discoveryStrategy** (string)

  DiscoveryStrategy describes how we set up pod watches for the applied resources. This affects all systems that attach to pods, including PortForwards, PodLogStreams, resource readiness, and live-updates.

- **imageLocators** ([]KubernetesImageLocator)

  Descriptors of how to find images in the YAML.
  
  Needed when injecting images into CRDs.

  <a name="KubernetesImageLocator"></a>
  *Finds image references in Kubernetes YAML.*

  - **imageLocators.objectSelector** (ObjectSelector), required

    Selects which objects to look in.

    <a name="ObjectSelector"></a>
    *Selector for any Kubernetes-style API.*

  - **imageLocators.objectSelector.apiVersionRegexp** (string)

    A regular expression apiVersion match.

  - **imageLocators.objectSelector.kindRegexp** (string)

    A regular expression kind match.

  - **imageLocators.objectSelector.nameRegexp** (string)

    A regular expression name match.

  - **imageLocators.objectSelector.namespaceRegexp** (string)

    A regular expression namespace match.

  - **imageLocators.path** (string), required

    A JSON path to the image reference field.
    
    If Object is empty, the field should be a string.
    
    If Object is non-empty, the field should be an object with subfields.

  - **imageLocators.object** (KubernetesImageObjectDescriptor)

    A descriptor of the path and structure of an object that describes an image reference. This is a common way to describe images in CRDs, breaking them down into an object rather than an image reference string.

    <a name="KubernetesImageObjectDescriptor"></a>
    **

  - **imageLocators.object.repoField** (string), required

    The name of the field that contains the image repository.

  - **imageLocators.object.tagField** (string), required

    The name of the field that contains the image tag.

- **imageMaps** ([]string)

  Names of image maps that this applier depends on.
  
  The controller will watch all the image maps, and redeploy the entire YAML if any of the maps resolve to a new image.

- **kubernetesDiscoveryTemplateSpec** (KubernetesDiscoveryTemplateSpec)

  KubernetesDiscoveryTemplateSpec describes how we discover pods for resources created by this Apply.
  
  If not specified, the KubernetesDiscovery controller will listen to all pods, and follow owner references to find the pods owned by these resources.

  <a name="KubernetesDiscoveryTemplateSpec"></a>
  **

  - **kubernetesDiscoveryTemplateSpec.extraSelectors** ([]LabelSelector)

    ExtraSelectors are label selectors that will force discovery of a Pod even if it does not match the AncestorUID.
    
    This should only be necessary in the event that a CRD creates Pods but does not set an owner reference to itself.

    <a name="LabelSelector"></a>
    *A label selector is a label query over a set of resources. The result of matchLabels and matchExpressions are ANDed. An empty label selector matches all objects. A null label selector matches no objects.*

  - **kubernetesDiscoveryTemplateSpec.extraSelectors.matchExpressions** ([]LabelSelectorRequirement)

    matchExpressions is a list of label selector requirements. The requirements are ANDed.

    <a name="LabelSelectorRequirement"></a>
    *A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values.*

  - **kubernetesDiscoveryTemplateSpec.extraSelectors.matchExpressions.key** (string), required

    *Patch strategy: merge on key `key`*
    
    key is the label key that the selector applies to.

  - **kubernetesDiscoveryTemplateSpec.extraSelectors.matchExpressions.operator** (string), required

    operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist.

  - **kubernetesDiscoveryTemplateSpec.extraSelectors.matchExpressions.values** ([]string)

    values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch.

  - **kubernetesDiscoveryTemplateSpec.extraSelectors.matchLabels** (map[string]string)

    matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.

- **podLogStreamTemplateSpec** (PodLogStreamTemplateSpec)

  PodLogStreamTemplateSpec describes the data model for PodLogStreams that KubernetesApply should set up.
  
  Underneath the hood, we'll create a KubernetesDiscovery object that finds the pods and sets up the pod log streams.
  
  If no template is specified, the controller will stream all pod logs available from the apiserver.

  <a name="PodLogStreamTemplateSpec"></a>
  *PodLogStreamTemplateSpec describes common attributes for PodLogStreams that can be shared across pods.*

  - **podLogStreamTemplateSpec.ignoreContainers** ([]string)

    The names of containers to exclude from the stream.
    
    If `onlyContainers` and `ignoreContainers` are not set, will watch all containers in the pod.

  - **podLogStreamTemplateSpec.onlyContainers** ([]string)

    The names of containers to include in the stream.
    
    If `onlyContainers` and `ignoreContainers` are not set, will watch all containers in the pod.

  - **podLogStreamTemplateSpec.sinceTime** (Time)

    An RFC3339 timestamp from which to show logs. If this value precedes the time a pod was started, only logs since the pod start will be returned. If this value is in the future, no logs will be returned.
    
    Translates directly to the underlying PodLogOptions.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

- **portForwardTemplateSpec** (PortForwardTemplateSpec)

  PortForwardTemplateSpec describes the data model for port forwards that KubernetesApply should set up.
  
  Underneath the hood, we'll create a KubernetesDiscovery object that finds the pods and sets up the port-forwarding. Only one PortForward will be active at a time.

  <a name="PortForwardTemplateSpec"></a>
  *PortForwardTemplateSpec describes common attributes for PortForwards that can be shared across pods.*

  - **portForwardTemplateSpec.forwards** ([]Forward), required

    One or more port forwards to execute on the given pod. Required.

    <a name="Forward"></a>
    *Forward defines a port forward to execute on a given pod.*

  - **portForwardTemplateSpec.forwards.containerPort** (int32), required

    The port on the Kubernetes pod to connect to. Required.

  - **portForwardTemplateSpec.forwards.host** (string)

    Optional host to bind to on the current machine (localhost by default)

  - **portForwardTemplateSpec.forwards.localPort** (int32)

    The port to expose on the current machine.
    
    If not specified (or 0), a random free port will be chosen and can be discovered via the status once established.

  - **portForwardTemplateSpec.forwards.name** (string)

    Name to identify this port forward.

  - **portForwardTemplateSpec.forwards.path** (string)

    Path to include as part of generated links for port forward.

- **restartOn** (RestartOnSpec)

  RestartOn determines external triggers that will result in an apply.

  <a name="RestartOnSpec"></a>
  *RestartOnSpec indicates the set of objects that can trigger a restart of this object.*

  - **restartOn.fileWatches** ([]string)

    FileWatches that can trigger a restart.

  - **restartOn.uiButtons** ([]string)

    UIButtons that can trigger a restart.

- **timeout** (Duration)

  The timeout on the apply operation.
  
  We've had problems with both: 1) CRD apiservers that take an arbitrarily long time to apply, and 2) Infinite loops in the apimachinery So we offer the ability to set a timeout on Kubernetes apply operations.
  
  The default timeout is 30s.

  <a name="Duration"></a>
  *Duration is a wrapper around time.Duration which supports correct marshaling to YAML and JSON. In particular, it marshals into strings, which can be used as map keys in json.*

- **yaml** (string)

  YAML to apply to the cluster.
  
  Exactly one of YAML OR ApplyCmd MUST be provided.





## KubernetesApplyStatus {#KubernetesApplyStatus}


KubernetesApplyStatus defines the observed state of KubernetesApply

<hr>

- **appliedInputHash** (string)

  A base64-encoded hash of all the inputs to the apply.
  
  We added this so that more procedural code can determine whether their updates have been applied yet or not by the reconciler. But any code using it this way should note that the reconciler may "skip" an update (e.g., if two images get updated in quick succession before the reconciler injects them into the YAML), so a particular ApplieInputHash might never appear.

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

- **error** (string)

  An error applying the YAML.
  
  If there was an error, than ResultYAML should be empty (and vice versa).

- **lastApplyStartTime** (MicroTime)

  Timestamp of when we last started applying this YAML to the cluster.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **lastApplyTime** (MicroTime)

  Timestamp of we last finished applying this YAML to the cluster.
  
  When populated, must be equal or after the LastApplyStartTime field.
  
  is more consistent with how we name this in other API objects.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **resultYAML** (string)

  The result of applying the YAML to the cluster. This should contain UIDs for the applied resources.





## KubernetesApplyList {#KubernetesApplyList}


KubernetesApplyList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: KubernetesApplyList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)), required









<hr>



