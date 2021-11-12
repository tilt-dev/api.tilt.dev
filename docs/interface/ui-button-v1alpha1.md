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

  - **inputs.bool** (UIBoolInputSpec)

    A Bool input that is true or false

    <a name="UIBoolInputSpec"></a>
    *Describes a boolean checkbox input field attached to a button.*

  - **inputs.bool.defaultValue** (boolean)

    Whether the input is initially true or false.

  - **inputs.bool.falseString** (string)

    If the input's value is converted to a string, use this when the value is false. If unspecified, its string value will be `"false"`

  - **inputs.bool.trueString** (string)

    If the input's value is converted to a string, use this when the value is true. If unspecified, its string value will be `"true"`

  - **inputs.hidden** (UIHiddenInputSpec)

    An input that has a constant value and does not display to the user

    <a name="UIHiddenInputSpec"></a>
    *Describes a hidden input field attached to a button, with a value to pass on any submit.*

  - **inputs.hidden.value** (string), required


  - **inputs.label** (string)

    A label to display next to this input in the UI.

  - **inputs.text** (UITextInputSpec)

    A Text input that takes a string.

    <a name="UITextInputSpec"></a>
    *Describes a text input field attached to a button.*

  - **inputs.text.defaultValue** (string)

    Initial value for this field.

  - **inputs.text.placeholder** (string)

    A short hint that describes the expected input of this field.

- **requiresConfirmation** (boolean)

  If true, the UI will require the user to click the button a second time to confirm before taking action





## UIButtonStatus {#UIButtonStatus}


UIButtonStatus defines the observed state of UIButton

<hr>

- **inputs** ([]UIInputStatus)

  Status of any inputs on this button.

  <a name="UIInputStatus"></a>
  *The status corresponding to a UIInputSpec*

  - **inputs.name** (string), required

    Name of the input whose status this is. Must match the `Name` of a corresponding UIInputSpec.

  - **inputs.bool** (UIBoolInputStatus)

    The status of the input, if it's a bool

    <a name="UIBoolInputStatus"></a>
    **

  - **inputs.bool.value** (boolean), required


  - **inputs.hidden** (UIHiddenInputStatus)

    The status of the input, if it's a hidden

    <a name="UIHiddenInputStatus"></a>
    **

  - **inputs.hidden.value** (string), required


  - **inputs.text** (UITextInputStatus)

    The status of the input, if it's text

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









<hr>



