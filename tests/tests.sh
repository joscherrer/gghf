#!/bin/bash

_script_path="$( cd -- "$(dirname "$0")" > /dev/null 2>&1; pwd)"
_cwd="${_script_path}"

rm -rf "$_cwd/gghf_test"
rm -rf "$_cwd/gghf_test.git"

mkdir -p "$_cwd/gghf_test"
mkdir -p "$_cwd/gghf_test.git"

# Creating test bare repo
cd "$_cwd/gghf_test.git" || exit 1
git init --bare
cp ../hooks/* hooks/

# Creating test repo
cd "$_cwd/gghf_test" || exit 1
git init
cp ../hooks/* .git/hooks/
echo "test" > file.txt
git add file.txt

# pre-commit, prepare-commit-msg, commit-msg, post-commit
git commit -m "test"

# pre-push
git remote add origin "$_cwd/gghf_test.git"
git push -u origin master

cd "$_cwd" || exit 1