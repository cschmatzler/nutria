apiVersion: v1
kind: Secret
metadata:
  name: tandoor-env
  namespace: medium-place
data:
  SECRET_KEY: {{ base64.Encode .Env.SECRET_KEY }}
  POSTGRES_HOST: {{ base64.Encode .Env.DATABASE_HOST }}
  POSTGRES_USER: {{ base64.Encode .Env.DATABASE_USERNAME }}
  POSTGRES_PASSWORD: {{ base64.Encode .Env.DATABASE_PASSWORD }}
  POSTGRES_DB: {{ base64.Encode .Env.DATABASE_NAME }}

