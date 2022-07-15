apiVersion: v1
kind: Secret
metadata:
  name: stolon-keeper-env
  namespace: stolon
data:
  STKEEPER_PG_SU_PASSWORD: {{ base64.Encode .Env.POSTGRES_PASSWORD }}
  STKEEPER_PG_REPL_PASSWORD: {{ base64.Encode .Env.REPLICATION_PASSWORD }}
