#!/usr/bin/env bash

set -uo pipefail

DEBUG=false
DRY_RUN=true
CONFIG_PATH=
ENV=alpha
HELM_REPO=mojanalytics/webapp
HELM_VER=2.13.0
NAMESPACE=apps-prod
MOJANALYTICS_REPO=http://moj-analytics-helm-repo.s3-website-eu-west-1.amazonaws.com
PLATFORM=$(uname -s)
SAVE_VALUES=false


usage() {
  cat << EOF
  usage: All arguments are optional
  -e - Environment e.g. dev or alpha, Default: alpha
  -d - Debug: true or false, Default: false
  -f - File: Path to config/values file, i.e. analytics-platform-config/chart-env-config/<ENV>/webapp.yml
  -n - Namespace: Kubernetes namespace, Default: apps-prod
  -s - Save release values yaml files: true or false, Default: false
  -h - Print usage
EOF
}

while getopts e:d:f:n:h option; do
  case $option in
    e   ) ENV="$OPTARG";;
    d   ) DEBUG="$OPTARG";;
    f   ) CONFIG_PATH="$OPTARG";;
    n   ) NAMESPACE="$OPTARG";;
    s   ) SAVE_VALUES="$OPTARG";;
    h   ) usage; exit 0;;
    \?  ) usage; exit 1;;
  esac
done

# If CONFIG_PATH has a value prefix it with "--values"
    if [[ ! -z $CONFIG_PATH && -f $CONFIG_PATH ]]; then

      CONFIG_PATH="--values ${CONFIG_PATH}"

    elif [[ ! -z $CONFIG_PATH && ! -f $CONFIG_PATH ]]; then

      Printf "\nCannot find config file: ${CONFIG_PATH}.  Are you sure it exists or is a file?\n"
      exit 1

    fi

while true; do
	read -p "Is this a DRY RUN? i.e. NO-OP [y/N]: " dry_run
	case $dry_run in
	    [y]*    ) DRY_RUN=true; break;;
	    [N]*    ) DRY_RUN=false; break;;
	    *       ) echo "Answer y to simulate the operation.  Answer N to perform the operation."; exit;;
    esac
done

# Grab the Helm client if not installed
which helm || wget --progress=dot:giga -O helm https://storage.googleapis.com/kubernetes-helm/helm-v$HELM_VER-$PLATFORM-amd64.tar.gz

if [ -f helm ]; then
  PATH="$PATH:$(pwd)"
  chmod +x helm
fi

# Ensure we've added our helm repo
helm repo list | grep -F 'mojanalytics' && helm repo update || helm repo add mojanalytics $MOJANALYTICS_REPO

# Get a list of shiny-apps
SHINY_APPS=$(helm ls --max 10000 --namespace "${NAMESPACE}" | awk '{print $1}')

# When specifying values files.  The priority will be given to the last (right-most) file specified
for shiny_app in $SHINY_APPS; do

  helm get values $shiny_app > ${shiny_app}.yaml && \
  helm upgrade --recreate-pods --dry-run=$DRY_RUN --namespace=$NAMESPACE $shiny_app $HELM_REPO \
    --debug=$DEBUG --values ${shiny_app}.yaml ${CONFIG_PATH}

  sleep 1

  if [ $SAVE_VALUES == false ]; then
    rm -f ${shiny_app}.yaml
  fi

done
