apiVersion: v1
kind: Secret
metadata:
  name: cloudflare-token
  namespace: cert-manager
stringData:
  CF_API_TOKEN: {{ .Env.CF_API_TOKEN }}
