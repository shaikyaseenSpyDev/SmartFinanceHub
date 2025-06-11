#!/bin/bash

# Script to set up git repository and push to GitHub
# Created by SpyDev

# Step 1: Initialize a new git repository if not already done
if [ ! -d .git ]; then
  echo "Initializing a new git repository..."
  git init
else
  echo "Git repository already exists."
fi

# Step 2: Add all files to staging
echo "Adding all files to staging..."
git add .

# Step 3: Commit changes
echo "Committing changes..."
git commit -m "Initial commit: Smart Finance Hub by SpyDev"

# Step 4: Add remote repository URL
echo "Adding remote repository..."
git remote add origin https://github.com/spydev/SmartFinanceHub.git

# Step 5: Rename master branch to main if needed (GitHub default is main)
git branch -M main

# Step 6: Push to GitHub
echo "Pushing to GitHub..."
git push -u origin main

echo ""
echo "Done! Your code has been pushed to GitHub repository: SmartFinanceHub"
echo "Visit: https://github.com/spydev/SmartFinanceHub"
