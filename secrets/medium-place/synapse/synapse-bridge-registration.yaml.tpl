apiVersion: v1
kind: Secret
metadata:
  name: synapse-bridge-registration
  namespace: medium-place
data:
  signal.yaml: {{ tmpl.Exec "signal" | base64.Encode }}
  facebook.yaml: {{ tmpl.Exec "facebook" | base64.Encode }}

{{ define "signal" }}
id: signal
as_token: {{ .Env.SIGNAL_AS_TOKEN }}
hs_token: {{ .Env.SIGNAL_HS_TOKEN }}
namespaces:
    users:
    - exclusive: true
      regex: '@signal_.*:medium\.place'
    - exclusive: true
      regex: '@signal:medium\.place'
    aliases: []
url: http://synapse-signal-bridge.medium-place.svc.cluster.local:29328
sender_localpart: {{ .Env.SIGNAL_SENDER_LOCALPART }} 
rate_limited: false
{{ end }}

{{ define "facebook" }}
id: facebook
as_token: {{ .Env.FACEBOOK_AS_TOKEN }}
hs_token: {{ .Env.FACEBOOK_HS_TOKEN }}
namespaces:
    users:
    - exclusive: true
      regex: '@facebook_.*:medium\.place'
    - exclusive: true
      regex: '@facebook:medium\.place'
    aliases: []
url: http://synapse-facebook-bridge.medium-place.svc.cluster.local:29319
sender_localpart: {{ .Env.FACEBOOK_SENDER_LOCALPART }} 
rate_limited: false
{{ end }}


