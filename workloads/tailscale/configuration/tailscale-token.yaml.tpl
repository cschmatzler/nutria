apiVersion: v1
kind: Secret
metadata:
  name: tailscale-auth
  namespace: tailscale
data:
  TS_AUTH_KEY: {{ base64.Encode .Env.TS_AUTH_KEY }}

