#!/usr/bin/env bash

set -u

TARGET=alpha
PIPELINES=$(fly -t ${TARGET} pipelines | awk '{ print $1 }')
OLD_REPO=https://ministryofjustice.github.io/analytics-platform-helm-charts/charts
NEW_REPO=http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com

mod_repo() {
  sed -i '' 's,'"$OLD_REPO"','"$NEW_REPO"',g' $1
}

for pipeline in $PIPELINES; do
    fly --target=$TARGET get-pipeline --pipeline=$pipeline > ${pipeline}.yaml \
    && mod_repo ${pipeline}.yaml \
    && fly --target=$TARGET set-pipeline --pipeline=$pipeline --non-interactive --config=${pipeline}.yaml \
    && rm -f ${pipeline}.yaml
done
