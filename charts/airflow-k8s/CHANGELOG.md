# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [0.0.8] - 2019-01-25
### Changed
Removed admin credentials from scheduler's init container definition.
Moved them in the secret so that if someone describe the pod will
not see the admin username/password/email


## [0.0.7] - 2019-01-25
### Changed
Moved OAuth secrets from ConfigMap to Secret. These are sensitive and it's
a best-practice to keep them in a secret.


## [0.0.6] - 2018-09-13
### Fixed
Fixed URLs in email notifications.


## [0.0.5] - 2018-09-12
### Fixed
SMTP secrets were not passed to the pods created by the `KubernetesPodOperator`.
This is the pod which sends the email on retry/fail so emails were not sent.


## [0.0.4] - 2018-09-07
### Added
Support for SMTP configuration. This allows sending of emails, e.g. on retries
failure, etc...


## [0.0.1] - 2018-06-15
### Added
First cut of Airflow helm chart configured to run tasks in new pods.

**NOTE**: This is heavily work in progress and probably not working.
