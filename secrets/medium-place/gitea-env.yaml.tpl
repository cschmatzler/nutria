apiVersion: v1
kind: Secret
metadata:
  name: gitea-env
  namespace: medium-place
data:
  GITEA__database__HOST: {{ base64.Encode .Env.DATABASE_HOST }}
  GITEA__database__USER: {{ base64.Encode .Env.DATABASE_USERNAME }}
  GITEA__database__PASSWD: {{ base64.Encode .Env.DATABASE_PASSWORD }}
  GITEA__database__NAME: {{ base64.Encode .Env.DATABASE_NAME }}
  GITEA__mailer__HOST: {{ base64.Encode .Env.SMTP_HOST }}
  GITEA__mailer__USER: {{ base64.Encode .Env.SMTP_USERNAME }}
  GITEA__mailer__PASSWD: {{ base64.Encode .Env.SMTP_PASSWORD }}
  GITEA__mailer__FROM: {{ base64.Encode .Env.SMTP_USERNAME }}
