apiVersion: v1
kind: Secret
metadata:
  name: vikunja-backend-env
  namespace: medium-place
data:
  VIKUNJA_DATABASE_HOST: {{ base64.Encode .Env.DATABASE_HOST }}
  VIKUNJA_DATABASE_USER: {{ base64.Encode .Env.DATABASE_USERNAME }}
  VIKUNJA_DATABASE_PASSWORD: {{ base64.Encode .Env.DATABASE_PASSWORD }}
  VIKUNJA_DATABASE_DATABASE: {{ base64.Encode .Env.DATABASE_NAME }}
