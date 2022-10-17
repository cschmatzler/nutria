apiVersion: v1
kind: Secret
metadata:
  name: synapse-bridge-registration
  namespace: medium-place
data:
  signal.yaml: {{ tmpl.Exec "signal" | base64.Encode }}
  whatsapp.yaml: {{ tmpl.Exec "whatsapp" | base64.Encode }}

{{ define "signal" }}
id: signal
url: http://synapse-signal-bridge.medium-place.svc.cluster.local:29328
as_token: {{ .Env.SIGNAL__AS_TOKEN }}
hs_token: {{ .Env.SIGNAL__HS_TOKEN }} 
sender_localpart: {{ .Env.SIGNAL__SENDER_LOCALPART }}
namespaces:
  users:
    - regex: '@signal:medium\.place'
      exclusive: true
    - regex: '@signal_.*:medium\.place'
      exclusive: true
  aliases: []
rate_limited: false
{{ end }}

{{ define "whatsapp" }}
id: whatsapp-bridge
url: http://synapse-whatsapp-bridge.medium-place.svc.cluster.local:29318
as_token: {{ .Env.WHATSAPP__AS_TOKEN }}
hs_token: {{ .Env.WHATSAPP__HS_TOKEN }}
sender_localpart: {{ .Env.WHATSAPP__SENDER_LOCALPART }}
rate_limited: false
namespaces:
  users:
    - regex: ^@whatsapp_bridge:medium\.place$
      exclusive: true
    - regex: ^@whatsapp_bridge_.*:medium\.place$
      exclusive: true
{{ end }}
