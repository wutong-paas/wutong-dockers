#!/bin/sh

if [ -z "$EDGE_ISOLATED_CLUSTER_CODE" ]; then
  echo "EDGE_ISOLATED_CLUSTER_CODE is not set. Exiting..."
  exit 1
fi

if [ -z "$WT_API_API_INNER_SERVICE_HOST" ]; then
  echo "WT_API_API_INNER_SERVICE_HOST is not set. Exiting..."
  exit 1
fi

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

echo "🕓 telepresence connect..."
telepresence connect -n wt-system || \
{ echo "🔴 telepresence connect failed. Exiting..."; exit 1; }
echo "🟢 telepresence connect done."

echo "🕓 telepresence intercept..."

telepresence intercept $EDGE_ISOLATED_CLUSTER_CODE-wt-api-agent --service $EDGE_ISOLATED_CLUSTER_CODE-wt-api-agent --address $WT_API_API_INNER_SERVICE_HOST --port 8888 || \
{ echo "🔴 telepresence intercept wt-api failed. Exiting..." ; exit 1; }

echo "🟢 telepresence intercept done."

# echo "⏳ keep container running..."
# sleep infinity
echo "⏳ port-forwarding..."
kubectl port-forward -n wt-system svc/$EDGE_ISOLATED_CLUSTER_CODE-wt-api-agent 8888:8888