#!/bin/bash

echo "-------------------------------------------------------------"
echo "WARNING: If you have yarn running, stop it now!"
echo "Script paused for 5 seconds..."
echo "-------------------------------------------------------------"

# Give the user 5 seconds to stop yarn
sleep 5

# Merge develop into master
git checkout develop
git pull origin develop
git checkout master
git pull origin master
git merge develop

# Run build tools
cd themes/starter
yarn
cd ../app
yarn
yarn package

# Check status
git status

echo "-------------------------------------------------------------"
echo "Build complete"
echo ""
echo "If the git status looks correct complete the deployment:"
echo "git add -A"
echo "git commit -m 'RELEASE $(date '+%Y-%m-%d %H:%M:%S')' --allow-empty"
echo "git push origin master"
echo "-------------------------------------------------------------"
