apiVersion: v1
kind: Secret
metadata:
  name: firefly-iii-env
  namespace: medium-place
stringData:
  APP_KEY: {{ .Env.APP_KEY }}
  STATIC_CRON_TOKEN: {{ .Env.STATIC_CRON_TOKEN }}
  DB_HOST: {{ .Env.DB_HOST }} 
  DB_USERNAME: {{ .Env.DB_USERNAME }}
  DB_PASSWORD: {{ .Env.DB_PASSWORD }}
  DB_DATABASE: {{ .Env.DB_DATABASE }}
  MAIL_HOST: {{ .Env.GLOBAL_SMTP_HOST }}
  MAIL_PORT: "465"
  MAIL_ENCRYPTION: tls
  MAIL_USERNAME: {{ .Env.GLOBAL_SMTP_USERNAME }}
  MAIL_PASSWORD: {{ .Env.GLOBAL_SMTP_PASSWORD }}
  MAIL_PROM: {{ .Env.GLOBAL_SMTP_USERNAME }}

