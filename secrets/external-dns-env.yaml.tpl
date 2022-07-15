apiVersion: v1
kind: Secret
metadata:
  name: external-dns-env
  namespace: external-dns
data:
  CF_API_TOKEN: {{ base64.Encode .Env.CLOUDFLARE_API_TOKEN }}
