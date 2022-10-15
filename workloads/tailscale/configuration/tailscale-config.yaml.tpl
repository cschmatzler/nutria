apiVersion: v1
kind: Secret
metadata:
  name: tailscale-config
  namespace: tailscale
stringData:
  TS_AUTH_KEY: {{ .Env.TS_AUTH_KEY }}

