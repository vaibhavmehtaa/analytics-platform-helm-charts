# network-policies Helm Chart

Helm chart to deploy `NetworkPolicy` resources.

At this stage this is mainly to deploy the `NetworkPolicy` that
block all ingress traffic a part from the one coming from the
ingress controller.

**NOTE** Your Kubernetes cluster needs to support `NetworkPolicy`
resources and it needs to use a network plugin which implements
them, e.g. Calico.


## Installing the Chart

To install the chart:

```bash
$ helm upgrade --install --dry-run --debug network-policies charts/network-policies --namespace default
```

**NOTE**: Remove `--dry-run` once you're happy with the output.


## Configuration

Listing only the required params here. See `/chart-env-config/` for more details.

| Parameter  | Description     | Default |
| ---------- | --------------- | ------- |
| `webapps.namespace` | namespace where webapps' pods are running | `"apps-prod"` |
| `webapps.ports` | array of [ports in NetworkPolicyPort format](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.14/#networkpolicyport-v1-networking-k8s-io) for which we allow ingress traffic | TCP port `3000` only |
| `ingressController.namespace` | namespace where your Ingress controller's pods run | `"default"` |
| `ingressController.podsMatchLabels` | map with labels to select your Ingress controller's pods (combined using AND) | only traffic from pods with `app=nginx-ingress` and `component=controller` is allowed |

**NOTE**: The `ingressController.podsMatchLabels` value is currently
not used until we upgrade Calico `v3.1.3` which supports the
[combined use of `namespaceSelector` and `podSelector`](https://github.com/projectcalico/libcalico-go/pull/872).


## Tests
This helm chart comes with some test to verify that the
network policies are only allowing external traffic from the
Ingress controller's pods:

```sh
$ helm test network-policies --cleanup

RUNNING: network-policies-test-traffic-from-pods-in-ns-blocked
PASSED: network-policies-test-traffic-from-pods-in-ns-blocked
RUNNING: network-policies-test-traffic-from-ingress-allowed
PASSED: network-policies-test-traffic-from-ingress-allowed
```
