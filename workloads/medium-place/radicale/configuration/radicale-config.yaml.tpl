apiVersion: v1
kind: Secret
metadata:
  name: radicale-config
  namespace: medium-place
data:
  config: {{ tmpl.Exec "config" | base64.Encode }}
  users: {{ tmpl.Exec "users" | base64.Encode }}
  rights: {{ tmpl.Exec "rights" | base64.Encode }}

{{ define "config" }}
[server]
hosts = 0.0.0.0:5232

[auth]
type = htpasswd
htpasswd_filename = /config/users
htpasswd_encryption = bcrypt
realm = Medium Place Address Book

[rights]
type = owner_only
file = /config/rights

[storage]
filesystem_folder = /data/collections
{{ end }}

{{ define "users" }}
christoph:{{ crypto.Bcrypt .Env.PASSWORD }}
{{ end }}

{{ define "rights" }}
[principal]
user: .+
collection: {user}
permissions: RW

[calendars]
user: .+
collection: {user}/[^/]+
permissions: rw
{{ end }}
