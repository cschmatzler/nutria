apiVersion: v1
kind: Secret
metadata:
  name: searxng-config
  namespace: medium-place
data:
  settings.yml: {{ tmpl.Exec "settings" | base64.Encode }}

{{ define "settings" }}
use_default_settings: true
server:
  secret_key: {{ .Env.SECRET_KEY }} 
  limiter: true
  image_proxy: true
ui:
  static_use_hash: true
redis:
  url: {{ .Env.REDIS_URL }}
{{ end }}
