apiVersion: v1
kind: Secret
metadata:
  name: photoprism-env
  namespace: medium-place
data:
  PHOTOPRISM_ADMIN_PASSWORD: {{ base64.Encode .Env.PHOTOPRISM_ADMIN_PASSWORD }}
