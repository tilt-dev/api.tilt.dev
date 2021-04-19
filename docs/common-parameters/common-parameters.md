---
layout: api
api_metadata:
  apiVersion: ""
  import: ""
  kind: "Common Parameters"
content_type: "api_reference"
description: ""
title: "Common Parameters"
weight: 5
---






## dryRun {#dryRun}

When present, indicates that modifications should not be persisted. An invalid or unrecognized dryRun directive will result in an error response and no further processing of the request. Valid values are: - All: all dry run stages will be processed

<hr>





## fieldManager {#fieldManager}

fieldManager is a name associated with the actor or entity that is making these changes. The value must be less than or 128 characters long, and only contain printable characters, as defined by https://golang.org/pkg/unicode/#IsPrint.

<hr>





## pretty {#pretty}

If 'true', then the output is pretty printed.

<hr>





