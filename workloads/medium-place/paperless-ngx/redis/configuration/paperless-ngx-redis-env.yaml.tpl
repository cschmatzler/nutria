apiVersion: v1
kind: Secret
metadata:
  name: paperless-ngx-redis-env
  namespace: medium-place
stringData:
  REDIS_PASSWORD: {{ .Env.REDIS_PASSWORD }}
