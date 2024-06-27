#!/bin/sh

if [ -z "$EDGE_CLUSTER_CODE" ]; then
  echo "CLUSTER_CODE is not set. Exiting..."
  exit 1
fi

echo "🕓 telepresence leave..."
telepresence leave $EDGE_CLUSTER_CODE-wt-api
echo "🟢 telepresence leave done."

echo "🕓 telepresence quit..."
telepresence quit -s
echo "🟢 telepresence quit done."