apiVersion: v1
kind: Secret
metadata:
  name: teslamate-grafana-env
  namespace: medium-place
data:
  DATABASE_HOST: {{ base64.Encode .Env.DATABASE_HOST }}
  DATABASE_USER: {{ base64.Encode .Env.DATABASE_USER }}
  DATABASE_PASS: {{ base64.Encode .Env.DATABASE_PASS }}
  DATABASE_NAME: {{ base64.Encode .Env.DATABASE_NAME }}
