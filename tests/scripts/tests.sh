#!/bin/bash
# - create repo
# - create bare repo
# - test with common hooks
#   - add
#   - commit
#   - push
# - test with repo hooks

set -x

pushd .

_root_path="$( cd -- "$(dirname "$0")/.." > /dev/null 2>&1; pwd)"

exit

rm -rf "$_root_path/gghf_test"
rm -rf "$_root_path/gghf_test.git"

mkdir -p "$_root_path/gghf_test"
mkdir -p "$_root_path/gghf_test.git"

touch "$_root_path/gghf_test_config"

# Creating test bare repo
cd "$_root_path/gghf_test.git" || exit 1
git init --bare
cp ../hooks/* hooks/

# Creating test repo
cd "$_root_path/gghf_test" || exit 1
git init
cp ../hooks/* .git/hooks/
echo "test" > file.txt

git add file.txt
# post-index-change

# post-index-change, pre-commit, prepare-commit-msg, commit-msg, post-commit
git commit -m "test"

# pre-push
# remote: pre-receive, update, post-receive, post-update
git remote add origin "$_root_path/gghf_test.git"
git push -u origin master

popd || exit 1
