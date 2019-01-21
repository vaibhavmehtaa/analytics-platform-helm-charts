# images-prepuller Helm Chart

Helm chart to pre-pull/cache Docker images on the kubernetes notes.


## Why?

Some Docker images are quite big and it can take some time for
them to be downloaded.

If that image was not already downloaded on that node, the first user
which spawns a tool pod using that docker image will have to wait more than
the usual.

This can be confusing for the users, as most of the time these
tools starts relatively quickly. When this takes longer, the user
perceive this delay as a symptom of "something that didn't work".

This is made worse by the fact that we now have configured our
kubernetes cluster to scale up and down. This means that new
nodes will be created more often. These fresh nodes
will not have the most used Docker images yet.


## How does it work?

This helm chart create a DaemonSet (ds) called `prepull`.
It will start a pod with an [init container] on each of the nodes.
This init container will go through the list of docker images to
cache and will run a `docker pull $IMAGE`.

This is based on this [gist].

**NOTE**: As these init containers are, well, containers we need
to mount the node's directory where the Docker images are stored
(`/var/run` by default) in order for the docker images' files to not be
lost when this container terminate.


[init container]: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
[gist]: https://gist.github.com/itaysk/7bc3e56d69c4d72a549286d98fd557dd


## Installing the Chart

To install the chart:

```bash
$ helm upgrade --dry-run --debug --install images-prepuller --namespace default charts/images-prepuller -f chart-env-config/ENV/images-prepuller.yml
```

**NOTE**: Remove `--dry-run` from command above.

## Configuration

Listing only the required params here. See `/chart-env-config/` for more details.

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `docker.images` (required) | **List** of docker images to pre-pull/cache on all nodes. The images need to be in the normal Docker image format, for example `gcr.io/google-containers/busybox:1.27` | `[]` |
| `docker.hostPath` | This is the path on the node where Docker images are stored. | `"/var/run"` |


## How to debug/check images are pulled correctly?


### Check if DaemonSet's pods initialised correctly
If the prepulling failed for whatever reason (most likely a wrong
image name/tag or a network problem) you'll see that one of the pod
initialization will fail:

```bash
$ kubectl -n default get pods  -lname=prepull
NAME            READY     STATUS       RESTARTS   AGE
prepull-8nl4f   1/1       Running      0          4m
prepull-fhj6x   1/1       Running      0          3m
prepull-m4fdj   0/1       Init:Error   3          48s
```

### Get nature of failure
To get more information about the nature of the failure you can
inspect the logs of the initContainer (called `prepull`):

```bash
$ kubectl -n default logs -lname=prepull -c prepull
Pulling images on node 'ip-1-2-3-4.compute.internal'...

Pulling 'failme-really-do-it'...Using default tag: latest
Error response from daemon: repository failme-really-do-it not found: does not exist or no pull access

[...]
```

In this specific example the problem was a docker image which
doesn't exist.

### Determine if images were downloaded

Again, you can inspect the logs to see if an image was downloaded or if it
was already present on the node:

```bash
$ kubectl -n default logs -lname=prepull -c prepull
Pulling images on node 'ip-1-2-3-4.compute.internal'...

Pulling 'gcr.io/google-containers/busybox:1.27'...1.27: Pulling from google-containers/busybox
Digest: sha256:545e6a6310a27636260920bc07b994a299b6708a1b26910cfefd335fdfb60d2b
Status: Image is up to date for gcr.io/google-containers/busybox:1.27


Pulling 'busybox:1-musl'...1-musl: Pulling from library/busybox
Digest: sha256:366488474d5b8dfa2546ec5d220e86029925d6c2e54c3fdf45efbfdd06da8e4d
Status: Downloaded newer image for busybox:1-musl

[...]
```

In this case you can see that on this node (`ip-1-2-3-4.compute.internal`):
- `gcr.io/google-containers/busybox:1.27` was already up-to-date
- `busybox:1-musl` was new and it was downloaded


## How to determine the images to prepull/cache?

You can have a good idea of from where to start by listing all docker images
used by all deployments in any namespace:

```bash
$ kubectl get deployment --all-namespaces -o custom-columns=images:.spec.template.spec.containers[*].image
```
