apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-token
  namespace: external-dns
stringData:
  CF_API_TOKEN: {{ .Env.CF_API_TOKEN }}
