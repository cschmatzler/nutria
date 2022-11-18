apiVersion: v1
kind: Secret
metadata:
  name: woodpecker-env
  namespace: medium-place
stringData:
  WOODPECKER_HOST: https://ci.medium.place
  WOODPECKER_SERVER: woodpecker-server:9000
  WOODPECKER_AGENT_SECRET: {{ .Env.WOODPECKER_SECRET }}
  WOODPECKER_GITHUB: "false"
  WOODPECKER_OPEN: "true"
  WOODPECKER_GITEA: "true"
  WOODPECKER_GITEA_URL: {{ .Env.WOODPECKER_GITEA_URL }}
  WOODPECKER_GITEA_CLIENT: {{ .Env.WOODPECKER_GITEA_CLIENT }}
  WOODPECKER_GITEA_SECRET: {{ .Env.WOODPECKER_GITEA_SECRET }}
  WOODPECKER_ADMIN: christoph

