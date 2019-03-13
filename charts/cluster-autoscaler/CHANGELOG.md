# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [0.1.3] - 2019-03-13
### Changed
- Increased CPU requests and limits from 100m to 200m and 500m respectively  

## [0.1.2] - 2018-11-20
### Added
- Modified image tag from `v1.2.2` to `v1.3.5` after cluster upgrade. See [version table](https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler#releases)

## [0.1.1] - 2018-11-20
### Added
- Added `Rolebinding` that allows __cluster-autoscaler__ to read the `configmap: cluster-autoscaler-status` in `namespace: default`
- Added `--namespace=default` flag as __cluster-autoscaler__ assumes that it's deployed to `namespace: kube-system`
