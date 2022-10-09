apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-token
  namespace: external-dns
data:
  CF_API_TOKEN: {{ base64.Encode .Env.CF_API_TOKEN }}
