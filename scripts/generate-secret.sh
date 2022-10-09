#!/bin/sh

set -eo pipefail

sops --age $AGE_PUBLIC_KEY --input-type dotenv -e $1.env.secret > $1.env.enc
env $(grep -v '^#' $1.env.secret | xargs -0) gomplate -f $1.tpl | sops --age $AGE_PUBLIC_KEY --input-type yaml --encrypted-regex '^(data|stringData)$' -e /dev/stdin > $1.enc
