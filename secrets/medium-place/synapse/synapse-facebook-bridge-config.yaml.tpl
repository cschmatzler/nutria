apiVersion: v1
kind: Secret
metadata:
  name: synapse-facebook-bridge-config
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
  address: http://synapse-facebook-bridge.medium-place.svc.cluster.local:29319
  tls_cert: false
  tls_key: false
  hostname: 0.0.0.0
  port: 29319
  max_body_size: 1
  database: {{ .Env.DATABASE_URL }}
  database_opts:
    min_size: 5
    max_size: 10
  id: facebook
  bot_username: facebook
  bot_displayname: Facebook Bridge
  bot_avatar: mxc://maunium.net/ygtkteZsXnGJLJHRchUwYWak
  ephemeral_events: true
  as_token: {{ .Env.AS_TOKEN }} 
  hs_token: {{ .Env.HS_TOKEN }}
  public:
    enabled: false
metrics:
  enabled: false
manhole:
  enabled: false
bridge:
  username_template: "facebook_{userid}"
  displayname_template: "{displayname} (Facebook)"
  displayname_preference:
    - full_name
    - first_name
  command_prefix: "!fb"
  initial_chat_sync: 20
  invite_own_puppet_to_pm: false
  sync_with_custom_puppets: true
  sync_direct_chat_list: false
  update_avatar_initial_sync: true
  delivery_receipts: false
  delivery_error_reports: true
  message_status_events: false
  allow_invites: false
  federate_rooms: true
  backfill:
    invite_own_puppet: true
    initial_limit: 0
    missed_limit: 1000
    disable_notifications: false
  periodic_reconnect:
    interval: -1
  resync_max_disconnected_time: 5
  sync_on_startup: true
  temporary_disconnect_notices: false
  disable_bridge_notices: false
  on_reconnection_fail:
    action: reconnect
    wait_for: 0
  resend_bridge_info: false
  mute_bridging: false
  tag_only_on_create: true
  sandbox_media_download: false
  get_proxy_api_url: null
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
  permissions:
    "*": "relay"
    "medium.place": "user"
    "@christoph:medium.place": "admin"
  relay:
    enabled: false
facebook:
  device_seed: generate
  default_region_hint: ODN
  connection_type: WIFI
  carrier: Verizon
  hni: 311390
logging:
  version: 1
  formatters:
    colored:
      (): mautrix_facebook.util.ColorFormatter
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
    maufbapi:
      level: DEBUG
    paho:
      level: INFO
    aiohttp:
      level: INFO
  root:
    level: DEBUG
    handlers: [console]
{{ end }}
