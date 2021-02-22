#!/usr/bin/env bash

# This scripts prepares for next release.
# See the comments of ./release.sh for more details.

set -eux

CURRENT=$(cd "$(dirname "$0")" && pwd)
VERSION=$1
MAJOR=$(echo "$VERSION" | cut -d. -f1)
MINOR=$(echo "$VERSION" | cut -d. -f2)
PATCH=$(echo "$VERSION" | cut -d. -f3)

cd "$CURRENT"
echo "$VERSION" > VERSION
perl -i -pe "s(docker://shogo82148/actions-cfn-lint:[-a-zA-Z0-9.]*)(docker://shogo82148/actions-cfn-lint:$VERSION)" action.yml
git add VERSION action.yml
git commit -m "bump v$MAJOR.$MINOR.$PATCH"
git push origin main

git tag -a "v$MAJOR.$MINOR.$PATCH" -m "release v$MAJOR.$MINOR.$PATCH"
git push origin "v$MAJOR.$MINOR.$PATCH"
