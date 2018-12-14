# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [1.1.2] - 2018-12-14
### Added
Added support for regional STS endpoint.

> STS also has regional endpoints which can only be explicitly used
> programatically. The use of a regional sts endpoint can reduce the
> latency for STS requests

By passing the `sts_region` value kube2iam will use regional endpoint
which can improve STS requests' latency.

By defaul kube2iam **will not** use regional STS endpoint.

See: https://github.com/jtblin/kube2iam#aws-sts-endpoint-and-regions

### Changed
- Pin version of kube2iam docker image and pull it only if necessary.
- Set Daemonset update strategy to `RollingUpdate`


## [1.0.0] - 2018-01-24
### Added
Added `ServiceAccount`, `ClusterRole`, `ClusterRoleBinding` and make
kube2iam use it so that it works when RBAC is enabled.
