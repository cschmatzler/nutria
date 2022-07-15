apiVersion: v1
kind: Secret
metadata:
  name: hcloud
  namespace: kube-system
data:
  token: {{ base64.Encode .Env.HCLOUD_TOKEN }}
  network: {{ base64.Encode "nutria" }}
