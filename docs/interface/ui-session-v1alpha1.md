---
layout: api
api_metadata:
  apiVersion: "tilt.dev/v1alpha1"
  import: "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"
  kind: "UISession"
content_type: "api_reference"
description: "UISession represents global status data for rendering the web UI."
title: "UISession v1alpha1"
weight: 1
---

`apiVersion: tilt.dev/v1alpha1`

`import "github.com/tilt-dev/tilt/pkg/apis/core/v1alpha1"`




## UISession {#UISession}


UISession represents global status data for rendering the web UI.

Treat this as a legacy data structure that's more intended to make transition easier rather than a robust long-term API.

Per-resource status data should be stored in UIResource.

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: UISession


- **metadata** ([ObjectMeta](../meta/object-meta#ObjectMeta))


- **spec** ([UISessionSpec](../interface/ui-session-v1alpha1#UISessionSpec))


- **status** ([UISessionStatus](../interface/ui-session-v1alpha1#UISessionStatus))






## UISessionSpec {#UISessionSpec}


UISessionSpec is an empty struct. UISession is a kludge for making Tilt's internal status readable, not for specifying behavior.

<hr>





## UISessionStatus {#UISessionStatus}


UISessionStatus defines the observed state of UISession

<hr>

- **fatalError** (string)

  A FatalError is an error that forces Tilt to stop its control loop. The API server will stay up and continue to serve the UI, but no further builds will happen.

- **featureFlags** ([]UIFeatureFlag)

  FeatureFlags reports a list of experimental features that have been enabled.

  <a name="UIFeatureFlag"></a>
  *Configures Tilt to enable non-default features (e.g., experimental or deprecated).
  
  The Tilt features controlled by this are generally in an unfinished state, and not yet documented.
  
  As a Tilt user, you don’t need to worry about this unless something else directs you to (e.g., an experimental feature doc, or a conversation with a Tilt contributor).*

  - **featureFlags.name** (string)

    The name of the flag.

  - **featureFlags.value** (boolean)

    The value of the flag.

- **needsAnalyticsNudge** (boolean)

  NeedsAnalyticsNudge reports whether the UI hasn't opted in or out of analytics, and the UI should nudge them to do so.

- **runningTiltBuild** (TiltBuild)

  RunningTiltBuild reports the currently running version of tilt that this UI is talking to.

  <a name="TiltBuild"></a>
  *Information about the running tilt binary.*

  - **runningTiltBuild.commitSHA** (string)

    The Git digest of the commit this binary was built at.

  - **runningTiltBuild.date** (string)

    A human-readable string representing when the binary was built.

  - **runningTiltBuild.dev** (boolean)

    Indicates whether this is a development build (true) or an official release (false).

  - **runningTiltBuild.version** (string)

    A semantic version string.

- **suggestedTiltVersion** (string)

  SuggestedTiltVersion tells the UI the recommended version for this user. If the version is different than what's running, the UI may display a prompt to upgrade.

- **tiltCloudSchemeHost** (string)

  TiltCloudSchemeHost reports the base URL of the Tilt Cloud instance associated with this Tilt process. Usually https://cloud.tilt.dev

- **tiltCloudTeamID** (string)

  TiltCloudTeamID reports the unique team id if the user is signed into TiltCloud and the Tiltfile declares a team.

- **tiltCloudTeamName** (string)

  TiltCloudUsername reports the human-readable team name if the user is signed into TiltCloud and the Tiltfile declares a team.

- **tiltCloudUsername** (string)

  TiltCloudUsername reports the username if the user is signed into TiltCloud.

- **tiltStartTime** (Time)

  The time that this instance of tilt started. Clients can use this to determine if the API server has restarted and all the objects need to be refreshed.

  <a name="Time"></a>
  *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

- **tiltfileKey** (string)

  An identifier for the Tiltfile that is running. Clients can use this to store data associated with a particular project in LocalStorage or other persistent storage.

- **versionSettings** (VersionSettings)

  VersionSettings indicates whether version updates have been enabled/disabled from the Tiltfile.

  <a name="VersionSettings"></a>
  *Information about how the Tilt binary handles updates.*

  - **versionSettings.checkUpdates** (boolean)

    Whether version updates have been enabled/disabled from the Tiltfile.





## UISessionList {#UISessionList}


UISessionList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: UISessionList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][UISession](../interface/ui-session-v1alpha1#UISession)), required









<hr>



