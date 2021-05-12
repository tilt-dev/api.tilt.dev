---
layout: api
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


- **spec** ([UISessionSpec](../user-interface/ui-session-v1alpha1#UISessionSpec))


- **status** ([UISessionStatus](../user-interface/ui-session-v1alpha1#UISessionStatus))






## UISessionSpec {#UISessionSpec}

UISessionSpec is an empty struct. UISession is a kludge for making Tilt's internal status readable, not for specifying behavior.

<hr>





## UISessionStatus {#UISessionStatus}

UISessionStatus defines the observed state of UISession

<hr>

- **fatalError** (string), required

  A FatalError is an error that forces Tilt to stop its control loop. The API server will stay up and continue to serve the UI, but no further builds will happen.

- **featureFlags** ([]UIFeatureFlag), required

  FeatureFlags reports a list of experimental features that have been enabled.

  <a name="UIFeatureFlag"></a>
  *Configures Tilt to enable non-default features (e.g., experimental or deprecated).
  
  The Tilt features controlled by this are generally in an unfinished state, and not yet documented.
  
  As a Tilt user, you don’t need to worry about this unless something else directs you to (e.g., an experimental feature doc, or a conversation with a Tilt contributor).*

  - **featureFlags.name** (string), required

    The name of the flag.

  - **featureFlags.value** (boolean), required

    The value of the flag.

- **needsAnalyticsNudge** (boolean), required

  NeedsAnalyticsNudge reports whether the UI hasn't opted in or out of analytics, and the UI should nudge them to do so.

- **runningTiltBuild** (TiltBuild), required

  RunningTiltBuild reports the currently running version of tilt that this UI is talking to.

  <a name="TiltBuild"></a>
  *Information about the running tilt binary.*

  - **runningTiltBuild.commitSHA** (string), required

    The Git digest of the commit this binary was built at.

  - **runningTiltBuild.date** (string), required

    A human-readable string representing when the binary was built.

  - **runningTiltBuild.dev** (boolean), required

    Indicates whether this is a development build (true) or an official release (false).

  - **runningTiltBuild.version** (string), required

    A semantic version string.

- **suggestedTiltVersion** (string), required

  SuggestedTiltVersion tells the UI the recommended version for this user. If the version is different than what's running, the UI may display a prompt to upgrade.

- **tiltCloudSchemeHost** (string), required

  TiltCloudSchemeHost reports the base URL of the Tilt Cloud instance associated with this Tilt process. Usually https://cloud.tilt.dev

- **tiltCloudTeamID** (string), required

  TiltCloudTeamID reports the unique team id if the user is signed into TiltCloud and the Tiltfile declares a team.

- **tiltCloudTeamName** (string), required

  TiltCloudUsername reports the human-readable team name if the user is signed into TiltCloud and the Tiltfile declares a team.

- **tiltCloudUsername** (string), required

  TiltCloudUsername reports the username if the user is signed into TiltCloud.

- **tiltStartTime** (Time), required

  The time that this instance of tilt started. Clients can use this to determine if the API server has restarted and all the objects need to be refreshed.

  <a name="Time"></a>
  *Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.*

- **tiltfileKey** (string), required

  An identifier for the Tiltfile that is running. Clients can use this to store data associated with a particular project in LocalStorage or other persistent storage.

- **versionSettings** (VersionSettings), required

  VersionSettings indicates whether version updates have been enabled/disabled from the Tiltfile.

  <a name="VersionSettings"></a>
  *Information about how the Tilt binary handles updates.*

  - **versionSettings.checkUpdates** (boolean), required

    Whether version updates have been enabled/disabled from the Tiltfile.





## UISessionList {#UISessionList}

UISessionList

<hr>

- **apiVersion**: tilt.dev/v1alpha1


- **kind**: UISessionList


- **metadata** ([ListMeta](../meta/list-meta#ListMeta))


- **items** ([][UISession](../user-interface/ui-session-v1alpha1#UISession)), required






## Operations {#Operations}



<hr>






### `get` read the specified UISession

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/uisessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the UISession


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): OK


### `get` read status of the specified UISession

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/uisessions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the UISession


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): OK


### `list` list or watch objects of kind UISession

#### HTTP Request

GET /apis/tilt.dev/v1alpha1/uisessions

#### Parameters


- **allowWatchBookmarks** (*in query*): boolean

  allowWatchBookmarks requests watch events with type "BOOKMARK". Servers that do not implement bookmarks may ignore this flag and bookmarks are sent at the server's discretion. Clients should not assume bookmarks are returned at any specific interval, nor may they assume the server will send any BOOKMARK event during a session. If this is not a watch, this field is ignored. If the feature gate WatchBookmarks is not enabled in apiserver, this field is ignored.


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

  Watch for changes to the described resources and return them as a stream of add, update, and remove notifications. Specify resourceVersion.



#### Response


200 ([UISessionList](../user-interface/ui-session-v1alpha1#UISessionList)): OK


### `create` create an UISession

#### HTTP Request

POST /apis/tilt.dev/v1alpha1/uisessions

#### Parameters


- **body**: [UISession](../user-interface/ui-session-v1alpha1#UISession), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): OK

201 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): Created

202 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): Accepted


### `update` replace the specified UISession

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/uisessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the UISession


- **body**: [UISession](../user-interface/ui-session-v1alpha1#UISession), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): OK

201 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): Created


### `update` replace status of the specified UISession

#### HTTP Request

PUT /apis/tilt.dev/v1alpha1/uisessions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the UISession


- **body**: [UISession](../user-interface/ui-session-v1alpha1#UISession), required

  


- **dryRun** (*in query*): string

  [dryRun](../common-parameters/common-parameters#dryRun)


- **fieldManager** (*in query*): string

  [fieldManager](../common-parameters/common-parameters#fieldManager)


- **pretty** (*in query*): string

  [pretty](../common-parameters/common-parameters#pretty)



#### Response


200 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): OK

201 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): Created


### `patch` partially update the specified UISession

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/uisessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the UISession


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


200 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): OK


### `patch` partially update status of the specified UISession

#### HTTP Request

PATCH /apis/tilt.dev/v1alpha1/uisessions/{name}/status

#### Parameters


- **name** (*in path*): string, required

  name of the UISession


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


200 ([UISession](../user-interface/ui-session-v1alpha1#UISession)): OK


### `delete` delete an UISession

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/uisessions/{name}

#### Parameters


- **name** (*in path*): string, required

  name of the UISession


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


### `deletecollection` delete collection of UISession

#### HTTP Request

DELETE /apis/tilt.dev/v1alpha1/uisessions

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

