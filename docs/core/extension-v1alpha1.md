---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "Extension"
content_type: "api_reference"
description: "Extension defines an extension that's evaluated on Tilt startup."
title: "Extension v1alpha1"
weight: 5
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## Extension {#Extension}


Extension defines an extension that's evaluated on Tilt startup.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: Extension


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([ExtensionSpec](../core/extension-v1alpha1#ExtensionSpec))


- **status** ([ExtensionStatus](../core/extension-v1alpha1#ExtensionStatus))






## ExtensionSpec {#ExtensionSpec}


ExtensionSpec defines the desired state of Extension

<hr>

- **repoName** (string), required

  RepoName specifies the ExtensionRepo object where we should find this extension.
  
  The Extension controller should watch for changes to this repo, and may update if this repo is deleted or moved.

- **repoPath** (string), required

  RepoPath specifies the path to the extension directory inside the repo.
  
  Once the repo is downloaded, this path should point to a directory with a Tiltfile as the main "entrypoint" of the extension.

- **args** ([]string)

  Arguments to the Tiltfile loaded by this extension.
  
  Arguments can be positional (['a', 'b', 'c']) or flag-based ('--to-edit=a'). By default, a list of arguments indicates the list of services in the tiltfile that should be enabled.





## ExtensionStatus {#ExtensionStatus}


ExtensionStatus defines the observed state of Extension

<hr>

- **error** (string)

  Contains information about any problems loading the extension.

- **path** (string)

  The path to the extension on disk. This location should be shared and readable by all Tilt instances.





## ExtensionList {#ExtensionList}


ExtensionList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ExtensionList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][Extension](../core/extension-v1alpha1#Extension)), required









<hr>



