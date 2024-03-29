apiVersion: v1
kind: Secret
metadata:
  name: synapse-signal-bridge-config
  namespace: medium-place
data:
  config.yaml: {{ tmpl.Exec "config" | base64.Encode }}

{{ define "config" }}
homeserver:
  address: http://synapse.medium-place.svc.cluster.local:8008
  domain: medium.place
  verify_ssl: true
  async_media: false

appservice:
  id: signal
  address: http://synapse-signal-bridge.medium-place.svc.cluster.local:29328
  hostname: 0.0.0.0
  port: 29328
  as_token: {{ .Env.APPSERVICE__AS_TOKEN }}
  hs_token: {{ .Env.APPSERVICE__HS_TOKEN }}
  database: {{ .Env.APPSERVICE__DATABASE }}
  database_opts:
    min_size: 5
    max_size: 10
  bot_username: signal
  bot_displayname: Signal Bridge
  bot_avatar: mxc://maunium.net/wPJgTQbZOtpBFmDNkiNEMDUp
  ephemeral_events: true

bridge:
  displayname_preference:
    - full_name
  federate_rooms: true
  encryption:
    allow: true
    default: true
    require: true
    verification_levels:
      receive: cross-signed-tofu
      send: cross-signed-tofu
      share: cross-signed-tofu
  management_room_text:
    welcome: "Welcome to the Medium Place Signal Bridge!"
  permissions:
    "*": "relay"
    "medium.place": "user"
    "@christoph:medium.place": "admin"

signal:
  socket_path: /signald/signald.sock
  outgoing_attachment_dir: /signald/attachments
  avatar_dir: /signald/avatars
  data_dir: /signald/data

manhole:
  enabled: false

logging:
  version: 1
  formatters:
    colored:
      (): mautrix_signal.util.ColorFormatter
      format: "[%(asctime)s] [%(levelname)s@%(name)s] %(message)s"
  handlers:
    console:
      class: logging.StreamHandler
      formatter: colored
  root:
    level: WARNING
    handlers: [console]

metrics:
  enabled: false
{{end}}
