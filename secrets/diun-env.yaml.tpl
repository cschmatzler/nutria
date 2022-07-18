apiVersion: v1
kind: Secret
metadata:
  name: diun-env
  namespace: diun
data:
  DIUN_REGOPTS_DOCKERIO_USERNAME: {{ base64.Encode .Env.DOCKER_USERNAME }}
  DIUN_REGOPTS_DOCKERIO_PASSWORD: {{ base64.Encode .Env.DOCKER_PASSWORD }}
  DIUN_NOTIF_MATRIX_HOMESERVERURL: {{ base64.Encode .Env.MATRIX_URL }}
  DIUN_NOTIF_MATRIX_USER: {{ base64.Encode .Env.MATRIX_USERNAME }}
  DIUN_NOTIF_MATRIX_PASSWORD: {{ base64.Encode .Env.MATRIX_PASSWORD }}
  DIUN_NOTIF_MATRIX_ROOMID: {{ base64.Encode .Env.MATRIX_ROOMID }}
