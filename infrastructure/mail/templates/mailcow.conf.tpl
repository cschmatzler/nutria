DOCKER_COMPOSE_VERSION=native
COMPOSE_PROJECT_NAME=nutria_mail

MAILCOW_HOSTNAME=mail.nutria.cloud

TZ=Etc/UTC

DBROOT=${database_root_password}
DBUSER=mailcow
DBPASS=${database_password}
DBNAME=mailcow

SKIP_CLAMD=n
SKIP_SOGO=y
SKIP_SOLR=y

USE_WATCHDOG=y
WATCHDOG_NOTIFY_BAN=n

ACME_CONTACT=christoph@nutria.cloud
DIRECTORY_URL=https://api.buypass.com/acme/directory
SKIP_IP_CHECK=y

MAILDIR_SUB=Maildir

