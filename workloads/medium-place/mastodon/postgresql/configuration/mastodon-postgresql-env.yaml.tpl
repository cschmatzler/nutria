apiVersion: v1
kind: Secret
metadata:
  name: mastodon-postgresql-env
  namespace: medium-place
data:
  POSTGRES_PASSWORD: {{ base64.Encode .Env.POSTGRES_PASSWORD }}

