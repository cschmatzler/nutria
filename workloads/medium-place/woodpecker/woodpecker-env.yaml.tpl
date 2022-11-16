apiVersion: v1
kind: Secret
metadata:
  name: woodpecker-env
  namespace: medium-place
stringData:
  WOODPECKER_HOST: ci.medium.place
  WOODPECKER_AGENT_SECRET: {{ .Env.WOODPECKER_SECRET }}
  WOODPECKER_GITHUB: "false"
  WOODPECKER_GITEA: "true"
  WOODPECKER_GITEA_URL: {{ .Env.WOODPECKER_GITEA_URL }}
  WOODPECKER_GITEA_CLIENT: {{ .Env.WOODPECKER_GITEA_CLIENT }}
  WOODPECKER_GITEA_SECRET: {{ .Env.WOODPECKER_GITEA_SECRET }}

