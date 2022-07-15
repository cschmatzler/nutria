apiVersion: v1
kind: Secret
metadata:
  name: synapse-config
  namespace: medium-place
data:
  homeserver.yaml: {{ tmpl.Exec "homeserver" | base64.Encode }}
  medium.place.signing.key: {{ base64.Encode .Env.SIGNING_KEY }}

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
    host: {{ .Env.DATABASE_HOST }}
    port: 5432
    user: {{ .Env.DATABASE_USERNAME }}
    password: {{ .Env.DATABASE_PASSWORD }}
    database: {{ .Env.DATABASE_NAME }}
    cp_min: 5
    cp_max: 10

media_store_path: /tmp
max_upload_size: 50M
media_storage_providers:
  - module: s3_storage_provider.S3StorageProviderBackend
    store_local: false
    store_remote: true
    store_synchronous: false
    config:
      endpoint_url: {{ .Env.S3_ENDPOINT }}
      region_name: {{ .Env.S3_REGION }}
      access_key_id: {{ .Env.S3_ACCESS_KEY }}
      secret_access_key: {{ .Env.S3_SECRET_KEY }}
      bucket: {{ .Env.S3_BUCKET }}

email:
  smtp_host: {{ .Env.SMTP_HOST }}
  smtp_port: 587
  enable_tls: true
  require_transport_security: true
  smtp_user: {{ .Env.SMTP_USERNAME }}
  smtp_pass: {{ .Env.SMTP_PASSWORD }}
  notif_from: 'Medium Place <services@leuchtturm.io>'

admin_contact: 'mailto:christoph@medium.place'

enable_registration: true
registrations_require_3pid:
  - email
allowed_local_3pids:
  - medium: email
    pattern: '^[^@]+@medium\.place$'
  - medium: email
    pattern: '^[^@]+@leuchtturm\.io$'
registration_requires_token: true
registration_shared_secret: {{ .Env.REGISTRATION_SECRET }}
macaroon_secret_key: {{ .Env.MACAROON_SECRET }}

presence:
  enabled: false 

allow_public_rooms_over_federation: false
require_auth_for_profile_requests: true
allow_profile_lookup_over_federation: false

push:
  include_content: false
  group_unread_count_by_room: false

report_stats: true
{{ end }}
