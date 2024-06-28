#!/bin/sh

if [ -z "$EDGE_ISOLATED_CLUSTER_CODE" ]; then
  echo "EDGE_ISOLATED_CLUSTER_CODE is not set. Exiting..."
  exit 1
fi

echo "🕓 telepresence leave..."
telepresence leave $EDGE_ISOLATED_CLUSTER_CODE-wt-api-http
telepresence leave $EDGE_ISOLATED_CLUSTER_CODE-wt-api-ws
echo "🟢 telepresence leave done."

echo "🕓 telepresence quit..."
telepresence quit -s
echo "🟢 telepresence quit done."