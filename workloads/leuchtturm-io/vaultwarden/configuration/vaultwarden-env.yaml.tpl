apiVersion: v1
kind: Secret
metadata:
  name: vaultwarden-env
  namespace: leuchtturm-io
stringData:
  DOMAIN: https://vault.leuchtturm.io 
  ROCKET_PORT: "8080"
  ADMIN_TOKEN: {{ .Env.ADMIN_TOKEN }}
  DATABASE_URL: {{ .Env.DATABASE_URL }}
  SMTP_HOST: {{ .Env.GLOBAL_SMTP_HOST }}
  SMTP_PORT: "465"
  SMTP_SECURITY: "force_tls"
  SMTP_USERNAME: {{ .Env.GLOBAL_SMTP_USERNAME }}
  SMTP_PASSWORD: {{ .Env.GLOBAL_SMTP_PASSWORD }}
  SMTP_FROM: {{ .Env.GLOBAL_SMTP_USERNAME }}
  SMTP_FROM_NAME: "Leuchtturm Vault"
  SIGNUPS_DOMAINS_WHITELIST: medium.place,frisch-luebeck.de
  SIGNUPS_VERIFY: "true"

