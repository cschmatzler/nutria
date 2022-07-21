apiVersion: v1
kind: Secret
metadata:
  name: synapse-signal-bridge-env
  namespace: medium-place
data:
  SIGNALD_DATABASE: {{ base64.Encode .Env.DATABASE_URL }}
