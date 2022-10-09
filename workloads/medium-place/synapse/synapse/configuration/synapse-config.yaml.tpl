apiVersion: v1
kind: Secret
metadata:
  name: synapse-config
  namespace: medium-place
data:
  homeserver.yaml: {{ tmpl.Exec "homeserver" | base64.Encode }}
  medium.place.signing.key: {{ base64.Encode .Env.MEDIUM_PLACE_SIGNING_KEY }}

{{ define "homeserver" }}
server_name: medium.place
public_baseurl: https://synapse.medium.place

listeners:
  - port: 8008
    tls: false
    type: http
    x_forwarded: true
    bind_addresses: ['0.0.0.0']

    resources:
      - names: [client, federation]
        compress: false

trusted_key_servers:
  - server_name: privacytools.io

database:
  name: psycopg2
  txn_limit: 10000
  args:
    host: {{ .Env.DATABASE__ARGS__HOST }}
    user: {{ .Env.DATABASE__ARGS__USER }}
    password: {{ .Env.DATABASE__ARGS__PASSWORD }}
    database: {{ .Env.DATABASE__ARGS__DATABASE }}

media_store_path: /data/media
max_upload_size: 50M

admin_contact: 'mailto:christoph@medium.place'

enable_registration: false
registration_requires_token: true
registration_shared_secret: {{ .Env.REGISTRATION_SHARED_SECRET }} 
macaroon_secret_key: {{ .Env.MACAROON_SECRET_KEY }} 

presence:
  enabled: true 

turn_uris: 
  - turn:turn.medium.place?transport=udp
  - turn:turn.medium.place?transport=tcp
turn_shared_secret: {{ .Env.TURN_SHARED_SECRET }} 
turn_user_lifetime: 86400000
turn_allow_guests: false

app_service_config_files:
  - /registrations/signal.yaml
  - /registrations/whatsapp.yaml

allow_public_rooms_over_federation: false
require_auth_for_profile_requests: true
allow_profile_lookup_over_federation: false

push:
  include_content: false
  group_unread_count_by_room: false

report_stats: true
{{ end }}
