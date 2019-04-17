# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [0.3.0] - 2019-04-16
### Added
- Allow __generic-support__ users to list namespaces. This is to make their
  life easier as they'll find the right namespace without necessarily go
  through the Control Panel. They can already read and list pods so this doesn't
  give support people much more power. [Trello](https://trello.com/c/meCj3EJ6).
- Allow __generic-support__ users to read pods logs


## [0.2.0] - 2018-01-24
### Added
- Created `ClusterRoleBinding` for __generic-support__ users. [Trello](https://trello.com/c/LsQcIL12)


## [0.1.2] - 2018-12-18
### Added
- Created `ClusterRoleBinding` for __kubelet-api__ user. [Trello](https://trello.com/c/YNDTzEIx)


## [0.1.1] - 2018-08-06
### Added
- Created `Rolebinding` for airflow support that binds to __app-support__ `Clusterrole`. [Trello](https://trello.com/c/Tq1xQCf3)


## [0.1.0] - 2018-07-23
### Initial Commit
- Initial chart development
- Adds binding for cluster-admins
- Adds role and binding for shiny app-support team
