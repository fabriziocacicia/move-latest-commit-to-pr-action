#!/bin/sh

while getopts b: flag
do
    case "${flag}" in
        b) NEW_BRANCH_NAME=${OPTARG};;
    esac
done

if [ -z "$NEW_BRANCH_NAME" ]; then
    echo "Missing new branch name. Exiting..."
    exit 0
fi

cd "${GITHUB_WORKSPACE}"

git config --global --add safe.directory /github/workspace

git fetch --all
git checkout -b $NEW_BRANCH_NAME
git push --set-upstream origin $NEW_BRANCH_NAME
