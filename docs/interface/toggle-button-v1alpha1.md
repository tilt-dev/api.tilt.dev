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









<hr>



