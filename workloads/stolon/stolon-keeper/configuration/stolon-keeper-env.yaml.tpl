apiVersion: v1
kind: Secret
metadata:
  name: stolon-keeper-env
  namespace: stolon
stringData:
  STKEEPER_PG_SU_PASSWORD: {{ .Env.STKEEPER_PG_SU_PASSWORD }}
  STKEEPER_PG_REPL_PASSWORD: {{ .Env.STKEEPER_PG_REPL_PASSWORD }}
