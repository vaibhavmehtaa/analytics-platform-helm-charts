# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [2.0.0] - 2019-05-20
### Changed
Using `auth-proxy` [`v4.0.0`](https://github.com/ministryofjustice/analytics-platform-auth-proxy/releases/tag/v4.0.0)
instead of the special `rstudio-auth-proxy`.

The logic to add the RStudio secure cookie is now in the `auth-proxy`
so we don't need to maintain two separate auth proxies.


## [1.10.0] - 2019-05-15
### Changed
Use `rstudio-auth-proxy` [`v2.0.0`](https://github.com/ministryofjustice/analytics-platform-rstudio-auth-proxy/releases/tag/v2.0.0).

## [1.9.0] - 2019-03-10

### Changed
- Version of RStudio image with conda (r3.5.1-py3.7-conda-1)

  New image able to recover from bad conda install better

## [1.8.0] - 2019-03-15

### Changed
- Added `"mojanalytics.xyz/idleable": "true"` label to pods. This will
  make the "don't idle if CPU usage is above X%" logic work again.


## [1.7.0] - 2019-03-15

### Changed
- added `host=` label to everything, this will help simplify the idler
- don't set unused `TOOLS_DOMAIN` environment variable
- simplified installation/upgrade instructions in README
- added `host` template to remove duplication
- removed unused `name` template


## [1.6.0] - 2019-02-14

### Changed
- Version of RStudio image with conda (r3.5.1-py3.7-conda)
- it doesn't point at the cran proxy
- does initial setup in an init container
- has a rstudio conda environment
- maintains support for projects still using packrat


## [1.5.8] - 2018-10-17

### Changed
- Version of rstudio image (3.4.2-6), it now points at the cran proxy, has boto3
  installed by default and is able to build udunits2 r package
- Change pull policy for rstudio container to be 'IfNotPresent' instead of 'Always'


## [1.5.7] - 2018-10-17

### Changed
- Don't hardcode target port in `Service`, use provided value
- Renamed ports in `Deployment` to be more explicit and avoid any possible
  confusion (they're now called `proxy` and `rstudio` respectively)
- Increaded probes' frequency by reduced `periodSeconds` to `2` from `5`,
  this could help with the user experience as k8s could respond to problems
  more promptly.

### Added
- Added `livenessProbe` to containers. This will ensure that containers
  are terminated (and restarted) when containers stop serving traffic
  for whatever reason.


## [1.5.6] - 2018-10-05
### Added
- Deployment has new label `idleable: "true"` to allow for future opt-in to new
  label-selector in the idler. This will allow idling of both rstudio (as
  currently avaiable) and jupyter or any other deployment we add this label to.


## [1.5.5] - 2018-08-15
### Changed
- Added tls config to ingress.  This is required for tls termination with the nginx ingress controller. See [Trello](https://trello.com/c/M1snktNZ)


## [1.5.4] - 2018-07-09
### Changed
- Modified RStudio image tag from v1.3.2 to 3.4.2-5 See: [PR](https://github.com/ministryofjustice/analytics-platform-rstudio/pull/34)


## [1.5.3] - 2018-06-05
### Changed
- Adjusted memory resource limits and requests from `request: 1GB => 5GB` & `limit: 12GB => 20GB`


## [1.5.2] - 2018-05-10
### Changed
Use `rstudio-auth-proxy` [`v1.4.3`](https://github.com/ministryofjustice/analytics-platform-rstudio-auth-proxy/releases/tag/v1.4.3.).
This version of the proxy updates some dependencies and fixes [CVE-2018-3728](https://nvd.nist.gov/vuln/detail/CVE-2018-3728).


## [1.5.1] - 2018-04-27
### RStudio Image
- Modified `values.yaml` to use v1.3.2 RStudio image.


## [1.5.0] - 2018-04-26
### New RStudio Image
- Modified `values.yaml` to use latest RStudio image. [Trello](https://trello.com/c/RvX3onRE)


## [1.4.2] - 2018-04-10
### Changed
- Cookie session lasts 8h instead of 1h (`COOKIE_MAXAGE` environment
variable).
  The reason is because RStudio is not making new HTTP requests and therefore
  not triggering the silent re-logging for users keeping RStudio open for
  more than 1h.


## [1.4.1] - 2018-02-28
### Added
- sets `COOKIE_MAXAGE` variable in auth proxy to expire session cookies after
  1 hour (can be configured via `authProxy.cookieMaxAge` value which by default
  is `3600` seconds)

### Changed
- Bumped `rstudio-auth-proxy` docker image used to `v1.4.2`.
  This version expires session cookies (after 1 hour by default).


## [1.4.0] - 2018-02-22
### Changed
- Bumped rstudio-auth-proxy docker image used to v1.4.1.
  This version enable silent SSO for RStudio
- Use newly added rstudio-auth-proxy's `GET /healthz` endpoint as
  readiness probe


## [1.3.3] - 2018-02-16
### Changed
- Bumped rstudio-auth-proxy docker image used to v1.3.0.
  This is the version using Auth0 hosted login page


## [1.3.0] - 2018-02-14
### Added
- Pass `APP_PROTOCOL` and `APP_HOST` to rstudio-auth-proxy container.
  This is required in order to Auth0 hosted login page logout to work.
- Added `CHANGELOG.md`
