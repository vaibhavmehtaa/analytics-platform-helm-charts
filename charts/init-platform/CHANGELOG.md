# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [1.0.0] - 2019-10-28
### Changed
- Modified nfs mount paths from `/users/homes` to `/users/home`
- Modified working directory from `/tmp/home` to `/tmp`
- `CHANGELOG.md`

## [0.1.0] - 2017
### Added
- Initial commit
- Init-Platform chart to create `storageclass` and `persistentvolume` for nfs server.  Prerequisite for `init-user` helm chart
