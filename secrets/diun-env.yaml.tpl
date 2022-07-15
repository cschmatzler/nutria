apiVersion: v1
kind: Secret
metadata:
  name: diun-env
  namespace: diun
data:
  DIUN_REGOPTS_DOCKERIO_USERNAME: {{ base64.Encode .Env.DOCKER_USERNAME }}
  DIUN_REGOPTS_DOCKERIO_PASSWORD: {{ base64.Encode .Env.DOCKER_PASSWORD }}
