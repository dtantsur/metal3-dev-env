#!/bin/bash

METAL3_DIR="$(dirname "$(readlink -f "${0}")")/../.."
# shellcheck disable=SC1091
# shellcheck disable=SC1090
source "${METAL3_DIR}/lib/common.sh"

# Cluster.
CLUSTER_YAML=cluster.yaml

make_cluster() {
  envsubst < "${V1ALPHAX_CR_PATH}${CLUSTER_YAML}"
}
make_cluster | kubectl apply -n metal3 -f -
