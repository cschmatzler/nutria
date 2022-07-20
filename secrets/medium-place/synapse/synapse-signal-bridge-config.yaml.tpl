apiVersion: v1
kind: Secret
metadata:
  name: synapse-signal-bridge-config
  namespace: medium-place
data:
  config.yaml: {{ tmpl.Exec "config" | base64.Encode }}

{{ define "config" }}
homeserver:
  address: https://synapse.medium.place 
  domain: medium.place
  verify_ssl: true
  asmux: false
  http_retry_count: 4
  status_endpoint: null
  message_send_checkpoint_endpoint: null
  connection_limit: 100
  async_media: false
appservice:
  address: http://synapse-signal-bridge.medium-place.svc.cluster.local:29328
  tls_cert: false
  tls_key: false
  hostname: 0.0.0.0
  port: 29328
  max_body_size: 1
  database: {{ .Env.DATABASE_URL }}
  database_opts:
    min_size: 5
    max_size: 10
  id: signal
  bot_username: signal
  bot_displayname: Signal Bridge
  bot_avatar: mxc://maunium.net/wPJgTQbZOtpBFmDNkiNEMDUp
  ephemeral_events: true
  as_token: {{ .Env.AS_TOKEN }} 
  hs_token: {{ .Env.HS_TOKEN }}
metrics:
  enabled: false
manhole:
  enabled: false
signal:
  socket_path: /signald/signald.sock
  outgoing_attachment_dir: /signald/attachments
  avatar_dir: /signald/avatars
  data_dir: /signald/data
  delete_unknown_accounts_on_start: false
  remove_file_after_handling: true
  registration_enabled: true
  enable_disappearing_messages_in_groups: false
bridge:
  username_template: "signal_{userid}"
  displayname_template: "{displayname} (Signal)"
  contact_list_names: prefer
  displayname_preference:
    - full_name
    - first_name
    - phone
  autocreate_group_portal: true
  autocreate_contact_portal: false
  sync_with_custom_puppets: true
  sync_direct_chat_list: false
  federate_rooms: true
  encryption:
    allow: true
    default: true
    require: true
    allow_key_sharing: false
    verification_levels:
      receive: unverified
      send: unverified
      share: cross-signed-tofu
    rotation:
      enable_custom: false
  private_chat_portal_meta: false
  delivery_receipts: false
  delivery_error_reports: true
  message_status_events: false
  resend_bridge_info: false
  periodic_sync: 0
  bridge_matrix_leave: true
  provisioning:
    enabled: true
    prefix: /_matrix/provision
    shared_secret: generate
    segment_key: null
  command_prefix: "!signal"
  management_room_text:
    welcome: "Hello, I'm a Signal bridge bot."
    welcome_connected: "Use `help` for help."
    welcome_unconnected: "Use `help` for help or `link` to log in."
  management_room_multiple_messages: false
  permissions:
    "*": "relay"
    "medium.place": "user"
    "@christoph:medium.place": "admin"
  relay:
    enabled: false
logging:
  version: 1
  formatters:
    colored:
      (): mautrix_signal.util.ColorFormatter
      format: "[%(asctime)s] [%(levelname)s@%(name)s] %(message)s"
    normal:
      format: "[%(asctime)s] [%(levelname)s@%(name)s] %(message)s"
  handlers:
    console:
      class: logging.StreamHandler
      formatter: colored
  loggers:
    mau:
      level: DEBUG
    aiohttp:
      level: INFO
  root:
    level: DEBUG
    handlers: [console]
{{end}}
