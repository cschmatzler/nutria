apiVersion: v1
kind: Secret
metadata:
  name: medium-place-vault-postgresql-env
  namespace: medium-place
stringData:
  POSTGRES_PASSWORD: {{ .Env.POSTGRES_PASSWORD }}
  MEDIUM_PLACE_VAULT_PASSWORD: {{ .Env.MEDIUM_PLACE_VAULT_PASSWORD }}
  AWS_ENDPOINT: https://s3.eu-central-2.wasabisys.com
  AWS_S3_FORCE_PATH_STYLE: "true"
  WALG_S3_PREFIX: s3://medium-place-postgres-wal/vault
  AWS_ACCESS_KEY_ID: {{ .Env.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: {{ .Env.AWS_SECRET_ACCESS_KEY }}
