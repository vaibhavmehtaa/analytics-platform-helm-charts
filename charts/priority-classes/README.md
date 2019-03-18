# Priority Classes

Creates `pod` [Priority Classes](https://kubernetes.io/docs/concepts/configuration/pod-priority-preemption/#priorityclass)

### Dependencies/Prerequisites

* As of K8s `1.11` the admission plugin that enforces the pod priority and preemption predicates is enabled by default

### Installing

```bash
helm upgrade priority-classes mojanalytics/priority-classes --install
```

### Configuration

| Parameter        | Description                     | Default |
| ----------       | ---------------                 | ------- |
| `name`           | (__required__) The name of the priority class  | ""      |
| `global`         | Setting to `true` indicates that this should be applied to pods that have not specified `priorityClassName` or `priority` (__This can only be applied once per cluster__) | `false` |
| `priority_value` | (__required__) The priority value between `0` and 1 billion (So we do not interfere with __system critical pods__). Higher value equals higher priority | "" |
| `description`    | Description of the `PriorityClass` use case    | ""      |

### Usage

Add `priorityClassName` and reference the name of the `PriorityClass` in the `pod` template spec:

```yaml
    spec:
      priorityClassName: system
      serviceAccountName: sysdig
      containers:
        - name: sysdig-inspect
          image: store/sysdig/sysdig:0.12.0
          imagePullPolicy: IfNotPresent
```
