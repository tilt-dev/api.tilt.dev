---
title: Tilt API Server Reference
layout: api
---

The Tilt Server API allows you to drill down into the depths of Tilt, to get at
exactly what you need without all the window-dressing.  Consume the API to
automate setup, scrape metrics and much more.

## Who This Guide Is For

This reference site is for dev environment maintainers who have already set up Tilt.

Here are some things that this guide might help with:

- trying to diagnose why Tilt isn't behaving like you expect, or

- writing new templates for dev environments to share across teams, or

- scraping metrics about your dev environment to track internally, or

- contributing to Tilt itself (!)

## Who This Guide Is NOT For

If you're trying to set up Tilt for the first time, you're in the wrong place!
But we'll help you find where you should be.

For new users, you want the [Tutorial](https://docs.tilt.dev/tutorial/index.html)
or one of the example projects.

<ul>
  {% for page in site.data.examples %}
     <li><a href="https://docs.tilt.dev/{{page.href \| escape}}">{{page.title \| escape}}</a></li>
  {% endfor %}
</ul>

For detailed help writing a Tiltfile, you want the [Tiltfile
Reference](https://docs.tilt.dev/api.html).

## How to Explore the API Server on Your Own

First, start up a Tilt environment:

```
tilt up
```

Then, in a separate terminal, run:

```
tilt api-resources
```

This will print out all the objects that your current environment supports.

```
$ tilt api-resources
NAME                    SHORTNAMES     APIVERSION          NAMESPACED   KIND
cmds                                   tilt.dev/v1alpha1   false        Cmd
configmaps              cm             tilt.dev/v1alpha1   false        ConfigMap
dockerimages                           tilt.dev/v1alpha1   false        DockerImage
...
```

Common objects in your dev environment might include:

- `Cmd` (local processes)
- `DockerImage` (Docker image builds)
- `KubernetesApply` (Resources to apply to your Kubernetes cluster, if you're using one)

The Tilt CLI supports many of the same subcommands and flags as `kubectl` for reading,
formatting, and applying objects.

To read the documentation about an object, use `tilt explain`:

```
$ tilt explain cmd
KIND:     Cmd
VERSION:  tilt.dev/v1alpha1

DESCRIPTION:
     Cmd represents a process on the host machine.
     When the process exits, we will make a best-effort attempt (within OS
     limitations) to kill any spawned descendant processes.
...
```

To read all the instances of an object in the current 
environment, use `tilt get`:

```
$ tilt get cmd
NAME             CREATED AT
gendocs:update   2021-11-23T16:23:34Z
```

For detailed human-readable information about an object, use `tilt describe`:

```
$ tilt describe cmd gendocs:update
...
  Ready:               true
  Terminated:
    Exit Code:    0
    Finished At:  2021-11-23T16:23:35.791652Z
    Pid:          116111
    Started At:   2021-11-23T16:23:34.648143Z
```

For detailed machine-readable information about an object, use `tilt get [name] -o [format]`

```
$ tilt get cmd gendocs:update -o jsonpath --template "{.metadata.name} {.status.ready}{'\n'}"
gendocs:update true
```

## Browsing the API

This guide is autogenerated from the latest version of Tilt. It contains the
complete API specification of all objects that the API Server currently
supports.

A Tiltfile is a much more scriptable and compact representation of your dev
environment. When Tilt evaluates your Tiltfile, it expands these API objects and
registers them with the API server.

This guide can help you browse the APIs available to you.
