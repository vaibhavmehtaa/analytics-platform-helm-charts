# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


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
