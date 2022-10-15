apiVersion: v1
kind: Secret
metadata:
  name: tandoor-env
  namespace: medium-place
stringData:
  TANDOOR_PORT: "8080"
  DEBUG: "0"
  SECRET_KEY: {{ .Env.SECRET_KEY }}
  DB_ENGINE: django.db.backends.postgresql
  POSTGRES_HOST: {{ .Env.POSTGRES_HOST }}
  POSTGRES_USER: {{ .Env.POSTGRES_USER }}
  POSTGRES_PASSWORD: {{ .Env.POSTGRES_PASSWORD }}
  POSTGRES_DB: {{ .Env.POSTGRES_DB }}

