# Set up elasticsearch for airflow

Intended for local testing.

Installs elasticsearch and filebeat and creates volumes necessary for these to function properly.

# Usage

Run `deploy.sh` to create volumes, install ES and filebeat, and render pod template.

```bash
export RELEASE_NAME=airflow-1  # required for rendering the pod template
./deploy.sh
```

Next you'll need to build an airflow image configured to use `pod_template.yaml` and install airflow with RELEASE_NAME.


