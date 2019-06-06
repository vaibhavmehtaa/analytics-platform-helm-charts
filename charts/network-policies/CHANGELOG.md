# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [0.1.0] - 2019-06-07
### Initial
Initial release with Network Policies to restrict
traffic to webapps' pods.

**NOTE**: Due to a limitation in older versions of Calico
the network policy will allow all traffic from the `default`
namespace rather than allow only traffic from Ingress controller'
pods. I've added a temporary (ugly-named by design) flag which
can be removed once we upgrade Calico (named `TEMPORARYnetworkPoliciesWithNamespaceAndPodSelectorsSupported`)
