#!/bin/bash

# Script to reset Git history and start fresh
# Created by SpyDev

echo "Removing existing Git repository..."
rm -rf .git

echo "Initializing new Git repository..."
git init

echo "Adding all files to new repository..."
git add .

echo "Creating initial commit..."
git commit -m "Initial commit: Personal Finance Management System by SpyDev"

echo "Git repository has been reset. You can now push to a new remote origin with:"
echo "git remote add origin https://github.com/spydev/personal-finance-management-system.git"
echo "git push -u origin main"

echo ""
echo "Note: If your default branch is 'master' instead of 'main', use:"
echo "git push -u origin master"
