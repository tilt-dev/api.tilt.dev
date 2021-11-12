---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "ExtensionRepo"
content_type: "api_reference"
description: "ExtensionRepo specifies a repo or folder where a set of extensions live."
title: "ExtensionRepo v1alpha1"
weight: 6
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## ExtensionRepo {#ExtensionRepo}


ExtensionRepo specifies a repo or folder where a set of extensions live.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ExtensionRepo


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([ExtensionRepoSpec](../core/extension-repo-v1alpha1#ExtensionRepoSpec))


- **status** ([ExtensionRepoStatus](../core/extension-repo-v1alpha1#ExtensionRepoStatus))






## ExtensionRepoSpec {#ExtensionRepoSpec}


ExtensionRepoSpec defines how to access the repo.

<hr>

- **url** (string), required

  The URL of the repo.
  
  Allowed: https: URLs that point to a public git repo file: URLs that point to a location on disk.

- **ref** (string)

  A reference to sync the repo to. If empty, Tilt will always update the repo to the latest version.





## ExtensionRepoStatus {#ExtensionRepoStatus}


ExtensionRepoStatus defines the observed state of ExtensionRepo

<hr>

- **checkoutRef** (string)

  The reference that we currently have checked out. On git, this is the commit hash. On file repos, this is empty.

- **error** (string)

  Contains information about any problems loading the repo.

- **lastFetchedAt** (Time)

  The last time the repo was fetched and checked for validity.

  <a name="Time"></a>
  *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

- **path** (string)

  The path to the repo on local disk.





## ExtensionRepoList {#ExtensionRepoList}


ExtensionRepoList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: ExtensionRepoList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][ExtensionRepo](../core/extension-repo-v1alpha1#ExtensionRepo)), required









<hr>



