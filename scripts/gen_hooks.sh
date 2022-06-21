#!/usr/bin/env bash

hooks=$(man githooks | grep -oP '^(\s{3}?)([a-zA-Z].*)$' | tr -d ' ')
mkdir -p ./tests/hooks

for hook in $hooks; do
    [ ! -f "./tests/hooks/$hook" ] && ln -s generic_hook ./tests/hooks/"$hook"
    [ ! -f "./$hook" ] && ln -s generic_hook "$hook"
done