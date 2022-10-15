apiVersion: v1
kind: Secret
metadata:
  name: searxng-redis-env
  namespace: medium-place
stringData:
  REDIS_PASSWORD: {{ .Env.REDIS_PASSWORD }}
