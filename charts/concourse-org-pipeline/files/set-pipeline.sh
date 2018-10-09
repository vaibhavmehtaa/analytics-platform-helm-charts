#!/bin/sh

curl -o /usr/local/bin/fly "$CONCOURSE_URL/api/v1/cli?arch=amd64&platform=linux"

chmod +x /usr/local/bin/fly

fly -t default login \
    -c $CONCOURSE_URL \
    -u $FLY_USERNAME \
    -p $FLY_PASSWORD \
    -n $CONCOURSE_TEAM

fly -t default set-pipeline \
    -n \
    -p $PIPELINE_NAME \
    -c /scripts/pipeline.yaml \
    -v team_name=$CONCOURSE_TARGET_TEAM \
    -v concourse_url=$CONCOURSE_URL \
    -v github-org=$1 \
    -v github-org-resource-image=$GITHUB_ORG_RESOURCE_IMAGE \
    -v github-org-resource-tag=$GITHUB_ORG_RESOURCE_TAG
