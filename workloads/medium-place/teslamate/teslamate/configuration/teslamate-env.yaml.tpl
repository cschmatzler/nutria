apiVersion: v1
kind: Secret
metadata:
  name: teslamate-env
  namespace: medium-place
stringData:
  ENCRYPTION_KEY: {{ .Env.ENCRYPTION_KEY }}
  DATABASE_HOST: {{ .Env.DATABASE_HOST }}
  DATABASE_USER: {{ .Env.DATABASE_USER }}
  DATABASE_PASS: {{ .Env.DATABASE_PASS }}
  DATABASE_NAME: {{ .Env.DATABASE_NAME }}
