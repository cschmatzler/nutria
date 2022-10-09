apiVersion: v1
kind: Secret
metadata:
  name: searxng-redis-env
  namespace: medium-place
data:
  REDIS_PASSWORD: {{ base64.Encode .Env.REDIS_PASSWORD }}
