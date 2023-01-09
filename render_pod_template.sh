if [[ -z "$RELEASE_NAME" ]]; then
    echo "No release name provided; exiting." 1>&2
	exit 1
fi
envsubst < pod_template.yaml.template > ./pod_template.yaml
