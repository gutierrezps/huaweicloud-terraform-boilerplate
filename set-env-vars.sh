#!/bin/sh

ENV_FILE=".env"

while IFS= read -r line; do
    # Skip empty or whitespace-only lines
    [ -z "$(printf '%s' "$line" | tr -d '[:space:]')" ] && continue

    # Skip commented lines
    case "$line" in \#*) continue ;; esac

    # Split key/value
    IFS='=' read -r key value <<EOF
$line
EOF

    # Strip surrounding double quotes from the value
    value=$(printf '%s' "$value" | sed 's/^"//; s/"$//')

    export "$key=$value"
done < "$ENV_FILE"
