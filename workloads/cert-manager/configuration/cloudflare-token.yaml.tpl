apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-token
  namespace: cert-manager
data:
  token: {{ base64.Encode .Env.TOKEN }}
