apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-token
  namespace: cert-manager
data:
  CF_API_TOKEN: {{ base64.Encode .Env.CF_API_TOKEN }}
