apiVersion: v1
kind: Secret
metadata:
  name: teslamate-env
  namespace: medium-place
data:
  ENCRYPTION_KEY: {{ base64.Encode .Env.ENCRYPTION_KEY }}
  DATABASE_HOST: {{ base64.Encode .Env.DATABASE_HOST }}
  DATABASE_USER: {{ base64.Encode .Env.DATABASE_USER }}
  DATABASE_PASS: {{ base64.Encode .Env.DATABASE_PASS }}
  DATABASE_NAME: {{ base64.Encode .Env.DATABASE_NAME }}