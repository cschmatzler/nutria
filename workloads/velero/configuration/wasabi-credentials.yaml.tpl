apiVersion: v1
kind: Secret

metadata:
  name: wasabi-credentials
  namespace: velero
  labels:
    app.kubernetes.io/part-of: velero

data:
  cloud: {{ tmpl.Exec "cloud" | base64.Encode }}
 
{{ define "cloud" }}
[default]
aws_access_key_id = {{ .Env.CLOUD__DEFAULT__AWS_ACCESS_KEY_ID }}
aws_secret_access_key = {{ .Env.CLOUD__DEFAULT__AWS_SECRET_ACCESS_KEY }}
{{ end }}
