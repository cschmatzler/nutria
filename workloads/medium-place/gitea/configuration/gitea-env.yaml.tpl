apiVersion: v1
kind: Secret
metadata:
  name: gitea-env
  namespace: medium-place
stringData:
  GITEA____APP_NAME: Medium Place Forge
  GITEA__server__DOMAIN: forge.medium.place
  GITEA__server__ROOT_URL: https://forge.medium.place
  GITEA__server__SSH_PORT: "22"
  GITEA__server__SSH_LISTEN_PORT: "2222"
  GITEA__database__DB_TYPE: postgres
  GITEA__database__HOST: {{ .Env.GITEA__database__HOST }}
  GITEA__database__USER: {{ .Env.GITEA__database__USER }}
  GITEA__database__PASSWD: {{ .Env.GITEA__database__PASSWD }}
  GITEA__database__NAME: {{ .Env.GITEA__database__NAME }}
  GITEA__security__PASSWORD_HASH_ALGO: argon2
  GITEA__service__EMAIL_DOMAIN_WHITELIST: medium.place
  GITEA__mailer__ENABLED: "true"
  GITEA__mailer__SMTP_HOST: "{{ .Env.GLOBAL_SMTP_HOST }}:465"
  GITEA__mailer__USER: {{ .Env.GLOBAL_SMTP_USERNAME }}
  GITEA__mailer__PASSWRD: {{ .Env.GLOBAL_SMTP_PASSWORD }}
  GITEA__mailer__FROM: "Medium Place Forge <{{ .Env.GLOBAL_SMTP_USERNAME }}>"
  GITEA__picture__DISABLE_GRAVATAR: "true"
  GITEA__service_0x2E_explore__DISABLE_USERS_PAGE: "true"
  GITEA__other__SHOW_FOOTER_VERSION: "false"
