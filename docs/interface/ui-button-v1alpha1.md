---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "UIButton"
content_type: "api_reference"
description: "UIButton."
title: "UIButton v1alpha1"
weight: 3
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`


## UIButton {#UIButton}

UIButton

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: UIButton


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([UIButtonSpec](../interface/ui-button-v1alpha1#UIButtonSpec))


- **status** ([UIButtonStatus](../interface/ui-button-v1alpha1#UIButtonStatus))






## UIButtonSpec {#UIButtonSpec}

UIButtonSpec defines the desired state of UIButton

<hr>

- **location** (UIComponentLocation), required

  Location associates the button with another component for layout.

  <a name="UIComponentLocation"></a>
  *UIComponentLocation specifies where to put a UI component.*

  - **location.componentID** (string), required

    ComponentID is the identifier of the parent component to associate this component with.
    
    For example, this is a resource name if the ComponentType is Resource.

  - **location.componentType** (string), required

    ComponentType is the type of the parent component.

- **text** (string), required

  Text to appear on the button itself or as hover text (depending on button location).

- **disabled** (boolean)

  If true, the button will be rendered, but with an effect indicating it's disabled. It will also be unclickable.

- **iconName** (string)

  IconName is a Material Icon to appear next to button text or on the button itself (depending on button location).
  
  Valid values are icon font ligature names from the Material Icons set. See https://fonts.google.com/icons for the full list of available icons.
  
  If both IconSVG and IconName are specified, IconSVG will take precedence.

- **iconSVG** (string)

  IconSVG is an SVG to use as the icon to appear next to button text or on the button itself (depending on button location).
  
  This should be an \<svg> element scaled for a 24x24 viewport.
  
  If both IconSVG and IconName are specified, IconSVG will take precedence.

- **inputs** ([]UIInputSpec)

  Any inputs for this button.

  <a name="UIInputSpec"></a>
  *Defines an Input to render in the UI. If UIButton is analogous to an HTML <form>, UIInput is analogous to an HTML <input>.*

  - **inputs.name** (string), required

    Name of this input. Must be unique within the UIButton.

  - **inputs.label** (string)

    A label to display next to this input in the UI.

  - **inputs.text** (UITextInputSpec)

    A Text input that takes a string.

    <a name="UITextInputSpec"></a>
    **

  - **inputs.text.defaultValue** (string)

    Initial value for this field.

  - **inputs.text.placeholder** (string)

    A short hint that describes the expected input of this field.





## UIButtonStatus {#UIButtonStatus}

UIButtonStatus defines the observed state of UIButton

<hr>

- **inputs** ([]UIInputStatus)

  Status of any inputs on this button.

  <a name="UIInputStatus"></a>
  *The status corresponding to a UIInputSpec*

  - **inputs.name** (string), required

    Name of the input whose status this is. Must match the `Name` of a corresponding UIInputSpec.

  - **inputs.text** (UITextInputStatus)

    The status of a text input

    <a name="UITextInputStatus"></a>
    **

  - **inputs.text.value** (string), required

    The content of the text input.

- **lastClickedAt** (MicroTime)

  LastClickedAt is the timestamp of the last time the button was clicked.
  
  If the button has never clicked before, this will be the zero-value/null.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*





## UIButtonList {#UIButtonList}

UIButtonList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: UIButtonList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][UIButton](../interface/ui-button-v1alpha1#UIButton)), required






## Operations {#Operations}



<hr>






### `get` read the specified UIButton

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/uibuttons/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the UIButton


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): OK


### `get` read status of the specified UIButton

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/uibuttons/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the UIButton


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): OK


### `list` list or watch objects of kind UIButton

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/uibuttons

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


200 ([UIButtonList](../interface/ui-button-v1alpha1#UIButtonList)): OK


### `create` create an UIButton

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/uibuttons

#### Parameters


- **body**: [UIButton](../interface/ui-button-v1alpha1#UIButton), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): OK

201 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): Created

202 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): Accepted


### `update` replace the specified UIButton

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/uibuttons/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the UIButton


- **body**: [UIButton](../interface/ui-button-v1alpha1#UIButton), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): OK

201 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): Created


### `update` replace status of the specified UIButton

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/uibuttons/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the UIButton


- **body**: [UIButton](../interface/ui-button-v1alpha1#UIButton), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): OK

201 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): Created


### `patch` partially update the specified UIButton

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/uibuttons/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the UIButton


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


200 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): OK


### `patch` partially update status of the specified UIButton

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/uibuttons/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the UIButton


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


200 ([UIButton](../interface/ui-button-v1alpha1#UIButton)): OK


### `delete` delete an UIButton

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/uibuttons/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the UIButton


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


### `deletecollection` delete collection of UIButton

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/uibuttons

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

