#!/usr/bin/env bash

# Increses RStudio session lifespan to 8 hours
#
# For each of the user namespaces (`user-*`), set `COOKIE_MAXAGE=28800`
# on each of the `rstudio-auth-proxy` containers for RStudio (selected using
# `app=rstudio` label)


set -ex

[[ -z "${DRYRUN}" ]] && DRYRUN='false'

COOKIE_MAXAGE=28800


NAMESPACES=`kubectl get ns | grep user- | cut -f1 -d' '`

for NAMESPACE in $NAMESPACES; do
  kubectl set env deployment --dry-run=${DRYRUN} \
    --namespace=${NAMESPACE} \
    --selector=app=rstudio --containers="rstudio-auth-proxy" \
    COOKIE_MAXAGE=${COOKIE_MAXAGE}
done
