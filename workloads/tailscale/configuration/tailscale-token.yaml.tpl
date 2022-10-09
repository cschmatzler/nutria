apiVersion: v1
kind: Secret
metadata:
  name: tailscale-token
  namespace: tailscale
data:
  TS_AUTH_KEY: {{ base64.Encode .Env.TS_AUTH_KEY }}

