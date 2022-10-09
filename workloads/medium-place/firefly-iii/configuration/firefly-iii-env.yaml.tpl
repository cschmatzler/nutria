apiVersion: v1
kind: Secret
metadata:
  name: firefly-iii-env
  namespace: medium-place
data:
  APP_KEY: {{ base64.Encode .Env.APP_KEY }}
  STATIC_CRON_TOKEN: {{ base64.Encode .Env.STATIC_CRON_TOKEN }}
  DB_HOST: {{ base64.Encode .Env.DB_HOST }} 
  DB_USERNAME: {{ base64.Encode .Env.DB_USERNAME }}
  DB_PASSWORD: {{ base64.Encode .Env.DB_PASSWORD }}
  DB_DATABASE: {{ base64.Encode .Env.DB_DATABASE }}
