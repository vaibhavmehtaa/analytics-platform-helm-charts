# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [0.3.2] - 2019-04-26
### Changed
- `auth-proxy` container don't run as root user


## [0.3.1] - 2019-04-25
### Changed
- Set auth-proxy name regex to exact match of username


## [0.3.0] - 2019-04-04
### Changed
- Added `"mojanalytics.xyz/idleable": "true"` label to pods. This will
  make the "don't idle if CPU usage is above X%" logic work again.


## [0.2.1] - 2019-03-28
### Changed
- Update version of auth-proxy to one that supports tunneling.
- Allow people to tunnel dash apps.


## [0.2.0] - 2019-03-15
### Changed
- added `host=` label to everything, this will help simplify the idler
- simplified installation/upgrade instructions in README
- added `host` template to remove duplication
- added NOTES.txt so that jupyter URL will be shown after installation


## [0.1.17] - 2019-03-07
### Changed
- Run `usermod` in Docker build to avoid it being run on startup. This will
improve startup time for users.


## [0.1.16] - 2018-12-13
### Changed
- Revert previous change setting uid as 1001 at the pod level. We have
put this back into the image as we found a couple of issues with this approach


## [0.1.14] - 2018-11-29
### Changed
- Jupyter-lab container will run as uid 1001 to match r-studio. This is
  no longer done by the image itself
- Re-added `livenessProbe` and `readinessProbe` from Jupyter container


## [0.1.13] - 2018-11-28
### Changed
- Removed `livenessProbe` and `readinessProbe` from Jupyter container


## [0.1.12] - 2018-11-19
### Changed
- Modified `livenessProbe` and `readinessProbe` to type `exec` for Jupyter container


## [0.1.11] - 2018-11-14
### Changed
- Adjusted `livenessProbe` and `readinessProbe` to bigger values for Jupyter container


## [0.1.10] - 2018-10-19
### Changed
- Added `livenessProbe` to be sure pods are terminated when unhealthy
- Reduced probes' `periodSeconds` from `5` to `2`
- Renamed ports in `Deployment` to `proxy`/`jupyter` instead of using `http`
  for everything which could lead to confusion
- Fixed indentation in `Deployment` YAML file


## [0.1.9] - 2018-10-16
### Changed
- Updated image tag to v0.6.0, which adds geospatial functionality, support for s3 access in spark, and the latest version of jupyter lab.


## [0.1.8] - 2018-10-05
### Added
- Add `idleable=true` annoation to the deployment. This is to allow opt-in to
  the idler.


## [0.1.7] - 2018-08-15
### Changed
- Added tls config to ingress.  This is required for tls termination with the nginx ingress controller. See [Trello](https://trello.com/c/M1snktNZ)
- Auth-proxy image tag from 0.1.4 to 0.1.3 while investigating ssl redirect issues


## [0.1.6] - 2018-08-10
## jupyter-tag-3
- Update datascience-notebook image tag from 0.3.3 to 0.4.0. Relates to [PR](https://github.com/ministryofjustice/analytics-platform-jupyter-notebook/pull/8)


## [0.1.5] - 2018-08-02
## Changed
- Update auth-proxy to v0.1.4, which fixes the login loop problem which happens
  when a user fails to login but is redirected back to the login page without an
  error message.


## [0.1.4] - 2018-07-17
## Jupyter Tag
-Updating the image tag from 0.3.2 to 0.3.3


## [0.1.3] - 2018-5-18
## Package Home
- Profile failed to auto load alias. Amended `pip-user-home.sh` to create `.bash_aliases` file which `.bashrc` checks exists
- [Trello](https://trello.com/c/NKz0zS0m)


## [0.1.2] - 2018-04-10
## Jupyter Auth0 CallBack URL
-  Fixing auth proxy callback envvar to point to the correct endpoint


## [0.1.1] - 2018-02-15
## Image Tag
- Modifying Image tag to point to latest image


## [0.1.0] - 2018-02-08
### Initial Commit
- Initial chart development
- Bash Profile job
