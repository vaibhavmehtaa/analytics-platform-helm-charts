# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [2.0.0] - 2018-09-26
### Changed
Added (optional) TLS block in ingress resource.
You can set the `ingress.addTlsBlock` value to `false` if your
ingress-controller doesn't work when ingress resources have this block (e.g.
[traefik](https://traefik.io) doesn't seem to work)


## [1.3.5] - 2018-02-14
### Changed
Using newly added `/healthz` endpoint instead of the `/login`.
Since we enabled Silent SSO the `/login` endpoint is not suitable
as a healtcheck endpoint anymore.


## [1.3.4] - 2018-02-14
### Removed
Removed `APP_PORT` environment variable, it's causing problems with the
logout in `dev`/`alpha`. See PR [Fixed logout in dev/alpha](https://github.com/ministryofjustice/analytics-platform-control-panel-frontend/pull/131).


## [1.3.0] - 2017-12-12
### Added
Added `TOOLS_DOMAIN` environment variable
