apiVersion: v1
kind: Secret
metadata:
  name: mastodon-redis-env
  namespace: medium-place
data:
  REDIS_PASSWORD: {{ base64.Encode .Env.REDIS_PASSWORD }}
