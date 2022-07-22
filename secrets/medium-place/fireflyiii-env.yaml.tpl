apiVersion: v1
kind: Secret
metadata:
  name: firefly-iii-env
  namespace: medium-place
data:
  APP_KEY: {{ base64.Encode .Env.APP_KEY }}
  DB_HOST: {{ base64.Encode .Env.DATABASE_HOST }}
  DB_PORT: {{ base64.Encode .Env.DATABASE_PORT }}
  DB_USERNAME: {{ base64.Encode .Env.DATABASE_USERNAME }}
  DB_PASSWORD: {{ base64.Encode .Env.DATABASE_PASSWORD }}
  DB_DATABASE: {{ base64.Encode .Env.DATABASE_NAME }}
