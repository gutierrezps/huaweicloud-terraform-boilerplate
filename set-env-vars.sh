#!/bin/sh

ENV_FILE=".env"

while IFS='=' read -r key value; do
    # Skip empty lines or commented lines
    [ -z "$key" ] && continue
    case "$key" in \#*) continue ;; esac

    # Strip surrounding double quotes from the value
    value=$(printf '%s' "$value" | sed 's/^"//; s/"$//')

    export "$key=$value"
done < "$ENV_FILE"
