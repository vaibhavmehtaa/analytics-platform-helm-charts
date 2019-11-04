# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [0.2.4] - 2019-11-01
### Changed
Diffent approach to long `host` labels.
Truncate to 63 chars was not good enough if the 63th
character happened to be a dot (`.`) because labels
can't end with a dot.

To maintain compatibility with existing clusters, charts
and unidler:
- if the length of `host` label value is <= 63 the value
  is the full host (as before)
- if the full host if longer than 63 characters we split
  by dots and we only use the part of the host before
  the first dot

Labels changes:
- Added `unidle-key` label to resources selected by the unidler
  to be more explicit than just using `host`.
- `host` label stays there as it's used in old `alpha` by
  unidler. We'll remove once `alpha` is retired
- `host` label is only kept for `Ingress`, `Deployment` and
  `Service` as there are the only `host` labels used by unidler
  (the rest were just added for consistency for human debugging
  but could lead to confusion, so removing)


## [0.2.3] - 2019-10-25
### Changed
- Truncate `host` label to make sure it's less than 63
  characters once we move to new domain.


## [0.2.2] - 2019-08-23
### Changed
Bumped auth-proxy to version v5.2.1.
This version removes the non-standard `prompt=none`.
Also note that v5.2.0 introduced support for logic to log into kibana.

This shouldn't be a breaking change.

https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v5.2.1


## [0.2.1] - 2019-05-22
### Changed
Bumped `auth-proxy` to version [`v4.0.1`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v4.0.1).

This version removes support for `NICKNAME_RE` and replaces it with
a simple equality check with the `USER` environment variable.


## [0.2.0] - 2019-01-01
### Changed
Set all containers to run in a single pod so it can be managed from the control panel.


## [0.1.0] - 2019-04-29
### Changed
Bumped Airflow to version `1.10.3`.

See:
- Dockerfile changes: https://github.com/ministryofjustice/analytics-platform-airflow-docker-image/pull/5
- Airflow Changelog: https://github.com/apache/airflow/blob/master/CHANGELOG.txt


## [0.0.2] - 2019-04-26
### Changed
`auth-proxy` don't run as root anymore.


## [0.0.1] - 2019-04-04
### Added
First attempt at self service Airflow running on Sqlite with no Redis
