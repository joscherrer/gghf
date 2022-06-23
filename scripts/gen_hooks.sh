#!/usr/bin/env bash

# This script generate the links to generic hooks

_root_path="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1; pwd)"
hooks=$(man githooks | grep -oP '^(\s{3}?)([a-zA-Z].*)$' | tr -d ' ')
mkdir -p "$_root_path"/hooks

for hook in $hooks; do
    echo "$_root_path/hooks/$hook"
    continue
    [ ! -f "$_root_path/hooks/$hook" ] && ln -s generic_hook "$_root_path/hooks/$hook"
done
