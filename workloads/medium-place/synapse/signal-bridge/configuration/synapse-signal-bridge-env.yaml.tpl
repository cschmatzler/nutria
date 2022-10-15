apiVersion: v1
kind: Secret
metadata:
  name: synapse-signal-bridge-env
  namespace: medium-place
stringData:
  SIGNALD_DATABASE: {{ .Env.SIGNALD_DATABASE }}
