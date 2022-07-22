#!/bin/zsh

set -eo pipefail

for template in $(fd --no-ignore --type file '^.*secret.yaml.tpl'); do
  echo "Rendering and encrypting $template"
  gomplate -f $template -o $(echo $template | sd '.tpl' '')
  sops --age $AGE_PUBLIC_KEY --encrypt --input-type binary $template > $(echo $template | sd 'secret' 'enc')
  sops --age $AGE_PUBLIC_KEY --encrypt --encrypted-regex '^(data|stringData)$' $(echo $template | sd '.tpl' '') > $(echo $template | sd '.tpl' '' | sd 'secret' 'enc')
done

