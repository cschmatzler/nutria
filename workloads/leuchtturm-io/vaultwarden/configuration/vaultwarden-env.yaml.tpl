apiVersion: v1
kind: Secret
metadata:
  name: vaultwarden-env
  namespace: leuchtturm-io
stringData:
  ADMIN_TOKEN: {{ .Env.ADMIN_TOKEN }}
  DATABASE_URL: {{ .Env.DATABASE_URL }}
  SMTP_HOST: {{ .Env.GLOBAL_SMTP_HOST }}
  SMTP_PORT: "465"
  SMTP_SECURITY: "force_tls"
  SMTP_USERNAME: {{ .Env.GLOBAL_SMTP_USERNAME }}
  SMTP_PASSWORD: {{ .Env.GLOBAL_SMTP_PASSWORD }}
  SMTP_FROM: {{ .Env.GLOBAL_SMTP_USERNAME }}
  SMTP_FROM_NAME: "Leuchtturm Vault"

