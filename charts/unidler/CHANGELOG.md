# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).


## [0.2.0] - 2018-09-25
### Changed
- Added `ingress.className` value to allow change of ingress controller used
  to handle ingress resources.
- Set docker image pull policy to `IfNotPresent` as we shouldn't need to
  re-download the docker image all the time as we pin the version
