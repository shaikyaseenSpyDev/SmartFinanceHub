#!/bin/bash

# Script to create a fresh Git repository without previous contribution history
# Created by SpyDev

# Step 1: Remove the existing .git directory to remove all history
echo "Removing existing Git history..."
rm -rf .git

# Step 2: Initialize a brand new Git repository
echo "Creating a fresh Git repository..."
git init

# Step 3: Add all files
echo "Adding all files to staging..."
git add .

# Step 4: Set your git identity (replace with your information)
echo "Setting Git identity..."
git config user.name "shaikyaseenSpyDev"
git config user.email "shaikyaseensy737@gmail.com"

# Step 5: Create the first commit
echo "Creating initial commit..."
git commit -m "Initial commit: SmartFinanceHub - Personal Finance Management System"

# Step 6: Add your remote repository
echo "Adding remote repository..."
git remote add origin https://github.com/shaikyaseenSpyDev/SmartFinanceHub.git

# Step 7: Push to GitHub with force flag to overwrite any existing history
echo "Pushing to GitHub with force flag..."
git branch -M main
git push -f -u origin main

echo ""
echo "Done! A fresh repository has been created and pushed to GitHub."
echo "This repository should only show you as the contributor."
echo "Visit: https://github.com/shaikyaseenSpyDev/SmartFinanceHub"
