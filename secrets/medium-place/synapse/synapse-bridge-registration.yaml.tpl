apiVersion: v1
kind: Secret
metadata:
  name: synapse-bridge-registration
  namespace: medium-place
data:
  signal.yaml: {{ tmpl.Exec "signal" | base64.Encode }}

{{ define "signal" }}
id: signal
as_token: {{ .Env.AS_TOKEN }}
hs_token: {{ .Env.HS_TOKEN }}
namespaces:
    users:
    - exclusive: true
      regex: '@signal_.*:medium\.place'
    - exclusive: true
      regex: '@signal:medium\.place'
    aliases: []
url: http://synapse-signal-bridge.medium-place.svc.cluster.local:29328
sender_localpart: {{ .Env.SENDER_LOCALPART }} 
rate_limited: false
{{ end }}


