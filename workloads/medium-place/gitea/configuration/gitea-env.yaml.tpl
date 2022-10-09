apiVersion: v1
kind: Secret
metadata:
  name: gitea-env
  namespace: medium-place
data:
  GITEA__database__HOST: {{ base64.Encode .Env.GITEA__database__HOST }}
  GITEA__database__USER: {{ base64.Encode .Env.GITEA__database__USER }}
  GITEA__database__PASSWD: {{ base64.Encode .Env.GITEA__database__PASSWD }}
  GITEA__database__NAME: {{ base64.Encode .Env.GITEA__database__NAME }}

