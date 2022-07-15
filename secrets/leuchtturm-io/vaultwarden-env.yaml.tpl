apiVersion: v1
kind: Secret
metadata:
  name: vaultwarden-env
  namespace: leuchtturm-io
data:
  ADMIN_TOKEN: {{ base64.Encode .Env.ADMIN_TOKEN }}
  DATABASE_URL: {{ base64.Encode .Env.DATABASE_URL }}
  SMTP_HOST: {{ base64.Encode .Env.SMTP_HOST }}
  SMTP_USERNAME: {{ base64.Encode .Env.SMTP_USERNAME }}
  SMTP_PASSWORD: {{ base64.Encode .Env.SMTP_PASSWORD }}
  SMTP_FROM: {{ base64.Encode .Env.SMTP_USERNAME }}
