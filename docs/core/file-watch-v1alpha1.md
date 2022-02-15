---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "FileWatch"
content_type: "api_reference"
description: "FileWatch."
title: "FileWatch v1alpha1"
weight: 2
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## FileWatch {#FileWatch}


FileWatch

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: FileWatch


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([FileWatchSpec](../core/file-watch-v1alpha1#FileWatchSpec))


- **status** ([FileWatchStatus](../core/file-watch-v1alpha1#FileWatchStatus))






## FileWatchSpec {#FileWatchSpec}


FileWatchSpec defines the desired state of FileWatch

<hr>

- **watchedPaths** ([]string), required

  WatchedPaths are paths of directories or files to watch for changes to. It cannot be empty.

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

- **ignores** ([]IgnoreDef)

  Ignores are optional rules to filter out a subset of changes matched by WatchedPaths.

  <a name="IgnoreDef"></a>
  *Describes sets of file paths that the FileWatch should ignore.*

  - **ignores.basePath** (string), required

    BasePath is the base path for the patterns. It cannot be empty.
    
    If no patterns are specified, everything under it will be recursively ignored.

  - **ignores.patterns** ([]string)

    Patterns are dockerignore style rules. Absolute-style patterns will be rooted to the BasePath.
    
    See https://docs.docker.com/engine/reference/builder/#dockerignore-file.





## FileWatchStatus {#FileWatchStatus}


FileWatchStatus defines the observed state of FileWatch

<hr>

- **disableStatus** (DisableStatus)

  Details about whether/why this is disabled.

  <a name="DisableStatus"></a>
  **

  - **disableStatus.disabled** (boolean), required

    Whether this is currently disabled. Deprecated in favor of `State`.

  - **disableStatus.lastUpdateTime** (Time), required

    The last time this status was updated.

    <a name="Time"></a>
    *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

  - **disableStatus.reason** (string), required

    The reason this status was updated.

  - **disableStatus.state** (string), required

    Whether this is currently disabled (if known)

- **error** (string)

  Error is set if there is a problem with the filesystem watch. If non-empty, consumers should assume that no filesystem events will be seen and that the file watcher is in a failed state.

- **fileEvents** ([]FileEvent)

  FileEvents summarizes batches of file changes (create, modify, or delete) that have been seen in ascending chronological order. Only the most recent 20 events are included.

  <a name="FileEvent"></a>
  **

  - **fileEvents.seenFiles** ([]string), required

    SeenFiles is a list of paths which changed (create, modify, or delete).

  - **fileEvents.time** (MicroTime), required

    Time is an approximate timestamp for a batch of file changes.
    
    This will NOT exactly match any inode attributes (e.g. ctime, mtime) at the filesystem level and is purely informational or for use as an opaque watermark.

    <a name="MicroTime"></a>
    *MicroTime is version of Time with microsecond level precision.*

- **lastEventTime** (MicroTime)

  LastEventTime is the timestamp of the most recent file event. It is zero if no events have been seen yet.
  
  If the specifics of which files changed are not important, this field can be used as a watermark without needing to inspect FileEvents.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*

- **monitorStartTime** (MicroTime)

  MonitorStartTime is the timestamp of when filesystem monitor was started. It is zero if the monitor has not been started yet.

  <a name="MicroTime"></a>
  *MicroTime is version of Time with microsecond level precision.*





## FileWatchList {#FileWatchList}


FileWatchList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: FileWatchList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][FileWatch](../core/file-watch-v1alpha1#FileWatch)), required









<hr>



