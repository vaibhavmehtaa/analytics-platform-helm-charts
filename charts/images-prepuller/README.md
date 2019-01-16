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
$ helm install charts/images-prepuller -f chart-env-config/ENV/images-prepuller.yml --name images-prepuller --namespace default
```


## Configuration

Listing only the required params here. See `/chart-env-config/` for more details.

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `docker.images` (required) | **List** of docker images to pre-pull/cache on all nodes. The images need to be in the normal Docker image format, for example `gcr.io/google-containers/busybox:1.27` | `[]` |
| `docker.hostPath` | This is the path on the node where Docker images are stored. | `"/var/run"` |
