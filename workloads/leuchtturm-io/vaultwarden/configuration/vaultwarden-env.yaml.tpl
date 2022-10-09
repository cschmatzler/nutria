apiVersion: v1
kind: Secret
metadata:
  name: vaultwarden-env
  namespace: leuchtturm-io
data:
  ADMIN_TOKEN: {{ base64.Encode .Env.ADMIN_TOKEN }}
  DATABASE_URL: {{ base64.Encode .Env.DATABASE_URL }}
