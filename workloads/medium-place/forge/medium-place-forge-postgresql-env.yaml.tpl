apiVersion: v1
kind: Secret
metadata:
  name: medium-place-forge-postgresql-env
  namespace: medium-place
stringData:
  POSTGRES_PASSWORD: {{ .Env.POSTGRES_PASSWORD }}
  MEDIUM_PLACE_FORGE_PASSWORD: {{ .Env.MEDIUM_PLACE_FORGE_PASSWORD }}
