apiVersion: v1
kind: Secret
metadata:
  name: paperless-ngx-redis-env
  namespace: medium-place
data:
  REDIS_PASSWORD: {{ base64.Encode .Env.REDIS_PASSWORD }}
