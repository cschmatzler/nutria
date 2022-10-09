apiVersion: v1
kind: Secret
metadata:
  name: synapse-whatsapp-bridge-config
  namespace: medium-place
data:
  config.yaml: {{ tmpl.Exec "config" | base64.Encode }}

{{ define "config" }}
homeserver:
  address: http://synapse.medium-place.svc.cluster.local:8008
  domain: medium.place
  async_media: true

appservice:
  id: whatsapp
  address: http://synapse-whatsapp-bridge.medium-place.svc.cluster.local:29318
  hostname: 0.0.0.0
  port: 29318
  as_token: {{ .Env.APPSERVICE__AS_TOKEN }}
  hs_token: {{ .Env.APPSERVICE__HS_TOKEN }}
  database:
    type: postgres
    uri: {{ .Env.APPSERVICE__DATABASE__URI }}
    max_open_conns: 20
    max_idle_conns: 2
  bot:
    username: whatsapp
    displayname: WhatsApp Bridge
    avatar: mxc://maunium.net/NeXNQarUbrlYBiPCpprYsRqr
    ephemeral_events: true

bridge:
  username_template: {{ "whatsapp_{{.}}" }}
  displayname_template: {{ "\"{{ .PushName }} (WhatsApp)\"" }}
  delivery_receipts: true
  identity_change_notices: true
  history_sync:
    request_full_sync: true
  management_room_text:
    welcome: "Welcome to the Medium Place WhatsApp Bridge!"
  encryption:
    allow: true
    default: true
    appservice: true
    require: true
    verification_levels:
      receive: cross-signed-tofu
      send: cross-signed-tofu
      share: cross-signed-tofu
  permissions:
    "*": relay
    "medium.place": user
    "@christoph@medium.place": admin

whatsapp:
  os_name: Synapse Bridge
  browser_name: chromium

metrics:
  enabled: false
{{ end }}
