# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).


## [0.2.1] - 2019-06-11
### Changes
Always restrict traffic to only the Ingress Controller pods rather than all
the pods in the namespace where Ingress Controller's pods run.
This was due to a limitation of an older version of Calico and it's not
necessary anymore now so I've simplified the template.


## [0.2.0] - 2019-06-10
### Changes
Added Helm tests so that we can verify the network policies
are working as expected.


## [0.1.0] - 2019-06-07
### Initial
Initial release with Network Policies to restrict
traffic to webapps' pods.

**NOTE**: Due to a limitation in older versions of Calico
the network policy will allow all traffic from the `default`
namespace rather than allow only traffic from Ingress controller'
pods. I've added a temporary (ugly-named by design) flag which
can be removed once we upgrade Calico (named `TEMPORARYnetworkPoliciesWithNamespaceAndPodSelectorsSupported`)
