# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


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
