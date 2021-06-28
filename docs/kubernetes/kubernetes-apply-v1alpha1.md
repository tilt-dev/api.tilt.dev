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

- **yaml** (string), required

  The YAML to apply to the cluster. Required.

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

- **timeout** (Duration)

  The timeout on the apply operation.
  
  We've had problems with both: 1) CRD apiservers that take an arbitrarily long time to apply, and 2) Infinite loops in the apimachinery So we offer the ability to set a timeout on Kubernetes apply operations.
  
  The default timeout is 30s.

  <a name="Duration"></a>
  *Duration is a wrapper around time.Duration which supports correct marshaling to YAML and JSON. In particular, it marshals into strings, which can be used as map keys in json.*





## KubernetesApplyStatus {#KubernetesApplyStatus}

KubernetesApplyStatus defines the observed state of KubernetesApply

<hr>

- **appliedInputHash** (string)

  A base64-encoded hash of all the inputs to the apply.
  
  We added this so that more procedural code can determine whether their updates have been applied yet or not by the reconciler. But any code using it this way should note that the reconciler may "skip" an update (e.g., if two images get updated in quick succession before the reconciler injects them into the YAML), so a particular ApplieInputHash might never appear.

- **error** (string)

  An error applying the YAML.
  
  If there was an error, than ResultYAML should be empty (and vice versa).

- **lastApplyTime** (MicroTime)

  The last time the controller tried to apply YAML.

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






## Operations {#Operations}



<hr>






### `get` read the specified KubernetesApply

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/kubernetesapplys/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the KubernetesApply


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): OK


### `get` read status of the specified KubernetesApply

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/kubernetesapplys/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the KubernetesApply


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): OK


### `list` list or watch objects of kind KubernetesApply

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/kubernetesapplys

#### Parameters


- **allowWatchBookmarks** (*in query*): boolean

  [allowWatchBookmarks](../common-parameters/common-parameters#allowWatchBookmarks)


- **continue** (*in query*): string

  [continue](../common-parameters/common-parameters#continue)


- **fieldSelector** (*in query*): string

  [fieldSelector](../common-parameters/common-parameters#fieldSelector)


- **labelSelector** (*in query*): string

  [labelSelector](../common-parameters/common-parameters#labelSelector)


- **limit** (*in query*): integer

  [limit](../common-parameters/common-parameters#limit)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)


- **resourceVersion** (*in query*): string

  [resourceVersion](../common-parameters/common-parameters#resourceVersion)


- **resourceVersionMatch** (*in query*): string

  [resourceVersionMatch](../common-parameters/common-parameters#resourceVersionMatch)


- **timeoutSeconds** (*in query*): integer

  [timeoutSeconds](../common-parameters/common-parameters#timeoutSeconds)


- **watch** (*in query*): boolean

  [watch](../common-parameters/common-parameters#watch)



#### Response


200 ([KubernetesApplyList](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApplyList)): OK


### `create` create a KubernetesApply

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/kubernetesapplys

#### Parameters


- **body**: [KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): OK

201 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): Created

202 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): Accepted


### `update` replace the specified KubernetesApply

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/kubernetesapplys/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the KubernetesApply


- **body**: [KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): OK

201 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): Created


### `update` replace status of the specified KubernetesApply

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/kubernetesapplys/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the KubernetesApply


- **body**: [KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): OK

201 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): Created


### `patch` partially update the specified KubernetesApply

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/kubernetesapplys/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the KubernetesApply


- **body**: [Patch](../meta/patch#Patch), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **force** (*in query*): boolean

  [force](../common-parameters/common-parameters#force)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): OK


### `patch` partially update status of the specified KubernetesApply

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/kubernetesapplys/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the KubernetesApply


- **body**: [Patch](../meta/patch#Patch), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **force** (*in query*): boolean

  [force](../common-parameters/common-parameters#force)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([KubernetesApply](../kubernetes/kubernetes-apply-v1alpha1#KubernetesApply)): OK


### `delete` delete a KubernetesApply

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/kubernetesapplys/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the KubernetesApply


- **body**: [DeleteOptions](../meta/delete-options#DeleteOptions)

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **gracePeriodSeconds** (*in query*): integer

  [gracePeriodSeconds](../common-parameters/common-parameters#gracePeriodSeconds)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)


- **propagationPolicy** (*in query*): string

  [propagationPolicy](../common-parameters/common-parameters#propagationPolicy)



#### Response


200 ([Status](../meta/status#Status)): OK

202 ([Status](../meta/status#Status)): Accepted


### `deletecollection` delete collection of KubernetesApply

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/kubernetesapplys

#### Parameters


- **body**: [DeleteOptions](../meta/delete-options#DeleteOptions)

  


- **continue** (*in query*): string

  [continue](../common-parameters/common-parameters#continue)


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldSelector** (*in query*): string

  [fieldSelector](../common-parameters/common-parameters#fieldSelector)


- **gracePeriodSeconds** (*in query*): integer

  [gracePeriodSeconds](../common-parameters/common-parameters#gracePeriodSeconds)


- **labelSelector** (*in query*): string

  [labelSelector](../common-parameters/common-parameters#labelSelector)


- **limit** (*in query*): integer

  [limit](../common-parameters/common-parameters#limit)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)


- **propagationPolicy** (*in query*): string

  [propagationPolicy](../common-parameters/common-parameters#propagationPolicy)


- **resourceVersion** (*in query*): string

  [resourceVersion](../common-parameters/common-parameters#resourceVersion)


- **resourceVersionMatch** (*in query*): string

  [resourceVersionMatch](../common-parameters/common-parameters#resourceVersionMatch)


- **timeoutSeconds** (*in query*): integer

  [timeoutSeconds](../common-parameters/common-parameters#timeoutSeconds)



#### Response


200 ([Status](../meta/status#Status)): OK

