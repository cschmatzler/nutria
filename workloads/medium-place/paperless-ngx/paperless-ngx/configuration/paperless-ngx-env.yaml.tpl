apiVersion: v1
kind: Secret
metadata:
  name: paperless-ngx-env
  namespace: medium-place
stringData:
  PAPERLESS_URL: https://archive.medium.place
  PAPERLESS_SECRET_KEY: {{ .Env.PAPERLESS_SECRET_KEY }}
  PAPERLESS_DBHOST: {{ .Env.PAPERLESS_DBHOST }}
  PAPERLESS_DBUSER: {{ .Env.PAPERLESS_DBUSER }}
  PAPERLESS_DBPASS: {{ .Env.PAPERLESS_DBPASS }}
  PAPERLESS_DBNAME: {{ .Env.PAPERLESS_DBNAME }}
  PAPERLESS_REDIS: {{ .Env.PAPERLESS_REDIS }}
  PAPERLESS_TIKA_ENABLED: "1"
  PAPERLESS_TIKA_ENDPOINT: http://paperless-ngx-tika.medium-place.svc.cluster.local:9998
  PAPERLESS_TIKA_GOTENBERG_ENDPOINT: http://paperless-ngx-tika.medium-place.svc.cluster.local:3000

