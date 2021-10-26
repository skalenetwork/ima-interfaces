#!/usr/bin/env bash

set -e

USAGE_MSG='Usage: BRANCH=[BRANCH] publish_package.sh'
if [ -z "$BRANCH" ]
then
    (>&2 echo 'You should provide branch')
    echo "$USAGE_MSG"
    exit 1
fi

cd "$(dirname "$0")/.."

BRANCH=$(echo $BRANCH | tr [:upper:] [:lower:] | tr -d [:space:])
VERSION=$(BRANCH=$BRANCH ./scripts/calculate_version.sh)

echo "Using $VERSION as a new version"

TAG=""
if ! [[ $BRANCH == 'stable' ]]
then
    TAG="--tag $BRANCH"
fi

cp LICENSE contracts
cp README.md contracts
cd contracts

yarn publish contracts --access public --new-version $VERSION --verbose --no-git-tag-version $TAG
