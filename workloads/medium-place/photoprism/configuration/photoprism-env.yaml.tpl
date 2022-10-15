apiVersion: v1
kind: Secret
metadata:
  name: photoprism-env
  namespace: medium-place
stringData:
  PHOTOPRISM_SITE_URL: https://gallery.medium.place
  PHOTOPRISM_DATABASE_DRIVER: sqlite
  PHOTOPRISM_ADMIN_PASSWORD: {{ .Env.PHOTOPRISM_ADMIN_PASSWORD }}
  PHOTOPRISM_EXPERIMENTAL: true
