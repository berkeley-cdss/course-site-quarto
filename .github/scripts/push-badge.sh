#!/bin/bash
set -e

if [ ! -f a11y-badge.json ]; then
  echo "a11y-badge.json not found, skipping push."
  exit 0
fi

echo "Setting up badges branch..."
mkdir -p badge-repo
cd badge-repo

git init
git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
git checkout -b badges

mv ../a11y-badge.json .
git add a11y-badge.json
git commit -m "Update a11y badge score"

echo "Pushing to badges branch..."
# GITHUB_TOKEN and GITHUB_REPOSITORY are expected to be available in the environment
git push --force "https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git" badges
echo "Successfully pushed a11y-badge.json to the badges branch."
