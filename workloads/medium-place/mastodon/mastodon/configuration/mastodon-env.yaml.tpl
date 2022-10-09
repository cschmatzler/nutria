apiVersion: v1
kind: Secret
metadata:
  name: mastodon-env
  namespace: medium-place
data:
  SECRET_KEY_BASE: {{ base64.Encode .Env.SECRET_KEY_BASE }}
  OTP_SECRET: {{ base64.Encode .Env.OTP_SECRET }}
  VAPID_PRIVATE_KEY: {{ base64.Encode .Env.VAPID_PRIVATE_KEY }}
  VAPID_PUBLIC_KEY: {{ base64.Encode .Env.VAPID_PUBLIC_KEY }}
  DB_HOST: {{ base64.Encode .Env.DB_HOST }}
  DB_USER: {{ base64.Encode .Env.DB_USER }}
  DB_PASS: {{ base64.Encode .Env.DB_PASS }}
  DB_NAME: {{ base64.Encode .Env.DB_NAME }}
  REDIS_URL: {{ base64.Encode .Env.REDIS_URL }}
  S3_ENDPOINT: {{ base64.Encode .Env.S3_ENDPOINT }}
  S3_ALIAS_HOST: {{ base64.Encode .Env.S3_ALIAS_HOST }} 
  S3_REGION: {{ base64.Encode .Env.S3_REGION }}
  S3_BUCKET: {{ base64.Encode .Env.S3_BUCKET }}
  AWS_ACCESS_KEY_ID: {{ base64.Encode .Env.AWS_ACCESS_KEY_ID }}
  AWS_SECRET_ACCESS_KEY: {{ base64.Encode .Env.AWS_SECRET_ACCESS_KEY }} 
