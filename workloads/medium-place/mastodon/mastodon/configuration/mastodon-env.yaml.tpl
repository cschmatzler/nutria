apiVersion: v1
kind: Secret
metadata:
  name: mastodon-env
  namespace: medium-place
stringData:
  LOCAL_DOMAIN: medium.place
  WEB_DOMAIN: plaza.medium.place
  WEB_CONCURRENCY: "2"
  MAX_THREADS: "4"
  SECRET_KEY_BASE: {{ .Env.SECRET_KEY_BASE }}
  OTP_SECRET: {{ .Env.OTP_SECRET }}
  VAPID_PRIVATE_KEY: {{ .Env.VAPID_PRIVATE_KEY }}
  VAPID_PUBLIC_KEY: {{ .Env.VAPID_PUBLIC_KEY }}
  DB_HOST: {{ .Env.DB_HOST }}
  DB_PORT: "5432"
  DB_USER: {{ .Env.DB_USER }}
  DB_PASS: {{ .Env.DB_PASS }}
  DB_NAME: {{ .Env.DB_NAME }}
  REDIS_URL: {{ .Env.REDIS_URL }}
  ES_ENABLED: "true"
  ES_HOST: mastodon-elasticsearch
  ES_PORT: "9200"
  S3_ENABLED: "true"
  S3_ENDPOINT: {{ .Env.S3_ENDPOINT }}
  S3_ALIAS_HOST: {{ .Env.S3_ALIAS_HOST }} 
  S3_REGION: {{ .Env.S3_REGION }}
  S3_BUCKET: {{ .Env.S3_BUCKET }}
  AWS_ACCESS_KEY_ID: {{ .Env.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: {{ .Env.AWS_SECRET_ACCESS_KEY }} 
  SMTP_SERVER: {{ .Env.GLOBAL_SMTP_HOST }}
  SMTP_PORT: "465"
  SMTP_TLS: "true"
  SMTP_LOGIN: {{ .Env.GLOBAL_SMTP_USERNAME }}
  SMTP_PASSWORD: {{ .Env.GLOBAL_SMTP_PASSWORD }}
  SMTP_FROM_ADDRESS: "Medium Place Plaza <{{ .Env.GLOBAL_SMTP_USERNAME }}>"
  EMAIL_DOMAIN_ALLOWLIST: medium.place
