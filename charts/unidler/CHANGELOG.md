# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


## [v2.0.0] - 2018-09-26
### Changed
Added (optional) TLS block in ingress resource.
You can set the `ingress.addTlsBlock` value to `false` if your
ingress-controller doesn't work when ingress resources have this block (e.g.
[traefik](https://traefik.io) doesn't seem to work)


## [v1.0.0] - 2018-09-25
### Changed
Use Host header instead of X-Forwarded-Host to determine pod to unidle.

This is required to work with Istio/Envoy.


## [0.2.0] - 2018-09-25
### Changed
- Added `ingress.className` value to allow change of ingress controller used
  to handle ingress resources.
- Set docker image pull policy to `IfNotPresent` as we shouldn't need to
  re-download the docker image all the time as we pin the version
