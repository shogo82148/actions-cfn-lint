#!/usr/bin/env bash

# This scripts prepares for next release.
# See the comments of ./release.sh for more details.

set -eux

CURRENT=$(cd "$(dirname "$0")" && pwd)
VERSION=$1
MAJOR=$(echo "$VERSION" | cut -d. -f1)
MINOR=$(echo "$VERSION" | cut -d. -f2)
PATCH=$(echo "$VERSION" | cut -d. -f3)
WORKING=$CURRENT/.working

: clone
ORIGIN=$(git remote get-url origin)
rm -rf "$WORKING"
git clone "$ORIGIN" "$WORKING"
cd "$WORKING"

: bump version
echo "$VERSION" > VERSION
git add VERSION
git commit -m "bump v$MAJOR.$MINOR.$PATCH"
git push origin main

: checkout releases branch
git checkout -b "releases/v$MAJOR" "origin/releases/v$MAJOR" || git checkout -b "releases/v$MAJOR" main
git merge -X theirs --no-ff -m "Merge branch 'main' into releases/v$MAJOR" main || true

: configure to use the pre-built image
git checkout main -- action.yml
perl -i -pe "s(image:\\s*\"Dockerfile\")(image: \"docker://ghcr.io/shogo82148/actions-cfn-lint:$VERSION\")" action.yml
git add action.yml
git commit -m "release v$MAJOR.$MINOR.$PATCH"

: publish to GitHub
git push origin "releases/v$MAJOR"
git tag -a "v$MAJOR.$MINOR.$PATCH" -m "release v$MAJOR.$MINOR.$PATCH"
git push origin "v$MAJOR.$MINOR.$PATCH"

: clean up
cd "$CURRENT"
rm -rf "$WORKING"
