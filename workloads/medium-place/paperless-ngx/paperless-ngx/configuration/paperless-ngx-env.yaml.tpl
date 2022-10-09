apiVersion: v1
kind: Secret
metadata:
  name: paperless-ngx-env
  namespace: medium-place
data:
  PAPERLESS_SECRET_KEY: {{ base64.Encode .Env.PAPERLESS_SECRET_KEY }}
  PAPERLESS_DBHOST: {{ base64.Encode .Env.PAPERLESS_DBHOST }}
  PAPERLESS_DBUSER: {{ base64.Encode .Env.PAPERLESS_DBUSER }}
  PAPERLESS_DBPASS: {{ base64.Encode .Env.PAPERLESS_DBPASS }}
  PAPERLESS_DBNAME: {{ base64.Encode .Env.PAPERLESS_DBNAME }}
  PAPERLESS_REDIS: {{ base64.Encode .Env.PAPERLESS_REDIS }}

