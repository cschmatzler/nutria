apiVersion: v1
kind: Secret
metadata:
  name: mastodon-env
  namespace: medium-place
data:
  DB_HOST: {{ base64.Encode .Env.DATABASE_HOST }}
  DB_USER: {{ base64.Encode .Env.DATABASE_USERNAME }}
  DB_PASS: {{ base64.Encode .Env.DATABASE_PASSWORD }}
  DB_NAME: {{ base64.Encode .Env.DATABASE_NAME }}
  REDIS_URL: {{ base64.Encode .Env.REDIS_URL }}
  SECRET_KEY_BASE: {{ base64.Encode .Env.SECRET_KEY_BASE }}
  OTP_SECRET: {{ base64.Encode .Env.OTP_SECRET }}
  VAPID_PRIVATE_KEY: {{ base64.Encode .Env.VAPID_PRIVATE_KEY }}
  VAPID_PUBLIC_KEY: {{ base64.Encode .Env.VAPID_PUBLIC_KEY }}
  SMTP_SERVER: {{ base64.Encode .Env.SMTP_HOST }}
  SMTP_LOGIN: {{ base64.Encode .Env.SMTP_USERNAME }}
  SMTP_PASSWORD: {{ base64.Encode .Env.SMTP_PASSWORD }}
  SMTP_FROM_ADDRESS: {{ base64.Encode .Env.SMTP_USERNAME }}
  S3_ENDPOINT: {{ base64.Encode .Env.S3_ENDPOINT }}
  S3_ALIAS_HOST: {{ base64.Encode .Env.S3_ALIAS }}
  S3_REGION: {{ base64.Encode .Env.S3_REGION }}
  S3_BUCKET: {{ base64.Encode .Env.S3_BUCKET }}
  AWS_ACCESS_KEY_ID: {{ base64.Encode .Env.S3_ACCESS_KEY }}
  AWS_SECRET_ACCESS_KEY: {{ base64.Encode .Env.S3_SECRET_KEY }}
