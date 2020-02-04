# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [2.0.2] - 2020-01-31
### Changed
Bumped auth-proxy from `v5.2.1` to `v5.2.4`.

This version updates some of the dependencies, [including
`handlebars` `4.7.2`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/pull/214)
which fixes a security vulnerability.

See:
- https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.4
- https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.3


## [2.0.1] - 2019-08-23
### Changed
Bumped auth-proxy to version `v5.2.1`.
This version removes the non-standard `prompt=none`.
Also note that `v5.2.0` introduced support for logic to log into kibana.

This shouldn't be a breaking change.

https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.1


## [2.0.0] - 2019-01-15
### Changed
- Added Auth Proxy to Kubernetes-Dashboard
- Modified Kubernetes-Dashboard image tag from  `v1.8.3` to `v1.10.1`
- Switch Kubernetes-Dashboard to insecure backend


## [1.0.0] - 2018-09-27
### Changed
- Added (optional) TLS block in ingress resource.
You can set the `ingress.addTlsBlock` value to `false` if your
ingress-controller doesn't work when ingress resources have this block (e.g.
[traefik](https://traefik.io) doesn't seem to work)
- Changed from passing the `servicesDomain` value to have an `ingress.host`
  value


## [0.1.0] - 2018-03-21
### Initial Commit
- Initial chart development
