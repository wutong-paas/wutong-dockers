#!/bin/sh

if [ -z "$EDGE_ISOLATED_CLUSTER_CODE" ]; then
  echo "EDGE_ISOLATED_CLUSTER_CODE is not set. Exiting..."
  exit 1
fi

AGENT_NAME=$EDGE_ISOLATED_CLUSTER_CODE-wt-api-agent

kubectl exec -n wt-system deployments/$AGENT_NAME -c $AGENT_NAME -- curl --max-time 1 $AGENT_NAME:8888