# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [0.1.0] - 2019-02-05
### Upstream Chart Migration/Initial Commit
- Initial commit
- Migrated our deployment from [CoreOS's deprecated chart](https://github.com/coreos/prometheus-operator/tree/master/helm) to [Helm stable repo chart](https://github.com/helm/charts/tree/master/stable/prometheus-operator)
- Secured [Prometheus](https://prometheus.services.dev.mojanalytics.xyz) and [AlertManager](https://alertmanager.services.dev.mojanalytics.xyz) front-ends with [auth-proxy](https://github.com/ministryofjustice/analytics-platform-auth-proxy)
- Migrated Dashboard templates to Grafana 5.4.x spec  
- Migrated Rules, Alerts and Dashboards from previous deployment
- Added `PodSecurityPolicy` in preparation for [Trello](https://trello.com/c/0mfKXhjp)
