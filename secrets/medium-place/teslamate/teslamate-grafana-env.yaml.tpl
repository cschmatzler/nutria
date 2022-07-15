apiVersion: v1
kind: Secret
metadata:
  name: teslamate-grafana-env
  namespace: medium-place
data:
  DATABASE_HOST: {{ base64.Encode .Env.DATABASE_HOST }}
  DATABASE_USER: {{ base64.Encode .Env.DATABASE_USERNAME }}
  DATABASE_PASS: {{ base64.Encode .Env.DATABASE_PASSWORD }}
  DATABASE_NAME: {{ base64.Encode .Env.DATABASE_NAME }}
