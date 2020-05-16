#!/usr/bin/env bash

set -eux

CURRENT=$(cd "$(dirname "$0")" && pwd)
VERSION=$1
MAJOR=$(echo "$VERSION" | cut -d. -f1)
MINOR=$(echo "$VERSION" | cut -d. -f2)
PATCH=$(echo "$VERSION" | cut -d. -f3)

cd "$CURRENT"
echo "$VERSION" > VERSION
perl -i -pe "s(image:\\s*'docker://shogo82148/actions-cfn-lint:[^']*')(image: 'docker://shogo82148/actions-cfn-lint:$VERSION')" action.yml
git add VERSION action.yml
git commit -m "bump v$MAJOR.$MINOR.$PATCH"
git push origin master

git tag -a "v$MAJOR.$MINOR.$PATCH" -m "release v$MAJOR.$MINOR.$PATCH"
git push origin "v$MAJOR.$MINOR.$PATCH"
git tag -fa "v$MAJOR" -m "release v$MAJOR.$MINOR.$PATCH"
git push -f origin "v$MAJOR"
