set -e

if [[ -z "$AIRFLOW_HOME" ]]; then
    echo "Airflow home not set; exiting." 1>&2
	exit 1
fi

envsubst < logs-volume.yaml | kubectl apply -f -

if [ -f ./pod_template.yaml ]; then
	echo "skipping pod_template.yaml render"
else
	echo "rendering pod_template.yaml"
	bash ./render_pod_template.sh
fi

helm upgrade --install -f elasticsearch.yaml my-elasticsearch elastic/elasticsearch
helm upgrade --install -f filebeat.yaml my-filebeat elastic/filebeat

# helm upgrade --install my-kibana elastic/kibana
