apiVersion: v1
kind: Secret
metadata:
  name: vaultwarden-env
  namespace: leuchtturm-io
data:
  ADMIN_TOKEN: {{ base64.Encode .Env.ADMIN_TOKEN }}
  DATABASE_URL: {{ base64.Encode .Env.DATABASE_URL }}
  SMTP_HOST: {{ base64.Encode .Env.GLOBAL_SMTP_HOST }}
  SMTP_PORT: {{ base64.Encode "465" }}
  SMTP_SECURITY: {{ base64.Encode "force_tls" }}
  SMTP_USERNAME: {{ base64.Encode .Env.GLOBAL_SMTP_USERNAME }}
  SMTP_PASSWORD: {{ base64.Encode .Env.GLOBAL_SMTP_PASSWORD }}
  SMTP_FROM: {{ base64.Encode .Env.GLOBAL_SMTP_USERNAME }}

