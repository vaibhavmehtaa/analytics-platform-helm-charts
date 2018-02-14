# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [1.3.4] - 2018-02-14
### Removed
Removed `APP_PORT` environment variable, it's causing problems with the
logout in `dev`/`alpha`. See PR [Fixed logout in dev/alpha](https://github.com/ministryofjustice/analytics-platform-control-panel-frontend/pull/131).


## [1.3.0] - 2017-12-12
### Added
Added `TOOLS_DOMAIN` environment variable
