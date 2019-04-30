#! /usr/bin/env bash

set -e
set -o pipefail


if [[ -z "$POD_CLEANER_PHASE" ]]; then
    echo "Must provide POD_CLEANER_PHASE, see https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#pod-phase"
    exit 1
fi

if [[ -z "$POD_CLEANER_DAYS" ]]; then
    echo "Must provide POD_CLEANER_DAYS"
    exit 1
fi


echo "Deleting pods in phase '$POD_CLEANER_PHASE' created more than $POD_CLEANER_DAYS days ago..."

DATE_CMD="date -d'now -$POD_CLEANER_DAYS days' -Is --utc"
CUTOFF=$(eval $DATE_CMD)

# Delete pods in $POD_CLEANER_PHASE phase created before $CUTOFF
kubectl get pods --field-selector status.phase==$POD_CLEANER_PHASE -o go-template --template '{{range .items}}{{.metadata.name}} {{.metadata.creationTimestamp}}{{"\n"}}{{end}}' | awk '$2 < "'$CUTOFF'" { print $1 }' | xargs --no-run-if-empty kubectl delete pod
