---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "ToggleButton"
content_type: "api_reference"
description: "ToggleButton."
title: "ToggleButton v1alpha1"
weight: 4
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## ToggleButton {#ToggleButton}

ToggleButton

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ToggleButton


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([ToggleButtonSpec](../interface/toggle-button-v1alpha1#ToggleButtonSpec))


- **status** ([ToggleButtonStatus](../interface/toggle-button-v1alpha1#ToggleButtonStatus))






## ToggleButtonSpec {#ToggleButtonSpec}

ToggleButtonSpec defines the desired state of ToggleButton

<hr>

- **defaultOn** (boolean), required

  If `StateSource` does not point at a valid value, the initial button state will be "on" or "off" depending on this bool

- **location** (UIComponentLocation), required

  Where to display the button

  <a name="UIComponentLocation"></a>
  *UIComponentLocation specifies where to put a UI component.*

  - **location.componentID** (string), required

    ComponentID is the identifier of the parent component to associate this component with.
    
    For example, this is a resource name if the ComponentType is Resource.

  - **location.componentType** (string), required

    ComponentType is the type of the parent component.

- **off** (ToggleButtonStateSpec), required

  Config for the button when it is "off"

  <a name="ToggleButtonStateSpec"></a>
  *Describes a state (on/off) of a ToggleButton*

  - **off.text** (string), required

    Text to appear on the button itself or as hover text (depending on button location).

  - **off.iconName** (string)

    IconName is a Material Icon to appear next to button text or on the button itself (depending on button location).
    
    Valid values are icon font ligature names from the Material Icons set. See https://fonts.google.com/icons for the full list of available icons.
    
    If both IconSVG and IconName are specified, IconSVG will take precedence.

  - **off.iconSVG** (string)

    IconSVG is an SVG to use as the icon to appear next to button text or on the button itself (depending on button location).
    
    This should be an \<svg> element scaled for a 24x24 viewport.
    
    If both IconSVG and IconName are specified, IconSVG will take precedence.

  - **off.requiresConfirmation** (boolean)

    If true, clicking the button in this state requires a second click to confirm.

- **on** (ToggleButtonStateSpec), required

  Config for the button when it is "on"

  <a name="ToggleButtonStateSpec"></a>
  *Describes a state (on/off) of a ToggleButton*

  - **on.text** (string), required

    Text to appear on the button itself or as hover text (depending on button location).

  - **on.iconName** (string)

    IconName is a Material Icon to appear next to button text or on the button itself (depending on button location).
    
    Valid values are icon font ligature names from the Material Icons set. See https://fonts.google.com/icons for the full list of available icons.
    
    If both IconSVG and IconName are specified, IconSVG will take precedence.

  - **on.iconSVG** (string)

    IconSVG is an SVG to use as the icon to appear next to button text or on the button itself (depending on button location).
    
    This should be an \<svg> element scaled for a 24x24 viewport.
    
    If both IconSVG and IconName are specified, IconSVG will take precedence.

  - **on.requiresConfirmation** (boolean)

    If true, clicking the button in this state requires a second click to confirm.

- **stateSource** (StateSource), required

  Where the toggle button's state is stored

  <a name="StateSource"></a>
  *Describes where a ToggleButton's state is stored. Exactly one type of source must be set.*

  - **stateSource.configMap** (ConfigMapStateSource)

    State is stored in a ConfigMap.

    <a name="ConfigMapStateSource"></a>
    *Describes how a ToggleButton's state is stored in a ConfigMap. The ConfigMap must be created separately - the ToggleButton will not automatically create it.*

  - **stateSource.configMap.key** (string), required

    Key within the ConfigMap

  - **stateSource.configMap.name** (string), required

    Name of the ConfigMap

  - **stateSource.configMap.offValue** (string)

    ConfigMap value corresponding to the button's "off" state If not specified, "false" will be used.

  - **stateSource.configMap.onValue** (string)

    ConfigMap value corresponding to the button's "on" state. If not specified, "true" will be used.





## ToggleButtonStatus {#ToggleButtonStatus}

ToggleButtonStatus defines the observed state of ToggleButton

<hr>

- **error** (string)

  If healthy, empty. If non-healthy, specifies a problem the ToggleButton encountered





## ToggleButtonList {#ToggleButtonList}

ToggleButtonList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ToggleButtonList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)), required






## Operations {#Operations}



<hr>






### `get` read the specified ToggleButton

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/togglebuttons/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ToggleButton


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): OK


### `get` read status of the specified ToggleButton

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/togglebuttons/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ToggleButton


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): OK


### `list` list or watch objects of kind ToggleButton

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/togglebuttons

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


200 ([ToggleButtonList](../interface/toggle-button-v1alpha1#ToggleButtonList)): OK


### `create` create a ToggleButton

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/togglebuttons

#### Parameters


- **body**: [ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): OK

201 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): Created

202 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): Accepted


### `update` replace the specified ToggleButton

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/togglebuttons/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ToggleButton


- **body**: [ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): OK

201 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): Created


### `update` replace status of the specified ToggleButton

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/togglebuttons/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ToggleButton


- **body**: [ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): OK

201 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): Created


### `patch` partially update the specified ToggleButton

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/togglebuttons/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ToggleButton


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


200 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): OK

201 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): Created


### `patch` partially update status of the specified ToggleButton

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/togglebuttons/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the ToggleButton


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


200 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): OK

201 ([ToggleButton](../interface/toggle-button-v1alpha1#ToggleButton)): Created


### `delete` delete a ToggleButton

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/togglebuttons/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the ToggleButton


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


### `deletecollection` delete collection of ToggleButton

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/togglebuttons

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

