apiVersion: v1
kind: Secret
metadata:
  name: authentik-env
  namespace: medium-place
data:
  AUTHENTIK_SECRET_KEY: {{ base64.Encode .Env.SECRET_KEY }}
  AUTHENTIK_BOOTSTRAP_PASSWORD: {{ base64.Encode .Env.BOOTSTRAP_PASSWORD }}
  AUTHENTIK_BOOTSTRAP_TOKEN: {{ base64.Encode .Env.BOOTSTRAP_TOKEN }}
  AUTHENTIK_POSTGRESQL__HOST: {{ base64.Encode .Env.DATABASE_HOST }}
  AUTHENTIK_POSTGRESQL__USER: {{ base64.Encode .Env.DATABASE_USERNAME }}
  AUTHENTIK_POSTGRESQL__PASSWORD: {{ base64.Encode .Env.DATABASE_PASSWORD }}
  AUTHENTIK_POSTGRESQL__NAME: {{ base64.Encode .Env.DATABASE_NAME }}
  AUTHENTIK_REDIS__HOST: {{ base64.Encode .Env.REDIS_HOST }}
  AUTHENTIK_REDIS__PASSWORD: {{ base64.Encode .Env.REDIS_PASSWORD }}
