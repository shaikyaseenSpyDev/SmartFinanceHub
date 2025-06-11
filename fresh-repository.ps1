# PowerShell script to create a fresh Git repository without previous contribution history
# Created by SpyDev

# Step 1: Remove the existing .git directory to remove all history
Write-Host "Removing existing Git history..."
Remove-Item -Path ".git" -Recurse -Force -ErrorAction SilentlyContinue

# Step 2: Initialize a brand new Git repository
Write-Host "Creating a fresh Git repository..."
git init

# Step 3: Add all files
Write-Host "Adding all files to staging..."
git add .

# Step 4: Set your git identity
Write-Host "Setting Git identity..."
git config user.name "shaikyaseenSpyDev"
git config user.email "shaikyaseensy737@gmail.com"

# Step 5: Create the first commit
Write-Host "Creating initial commit..."
git commit -m "Initial commit: SmartFinanceHub - Personal Finance Management System"

# Step 6: Add your remote repository
Write-Host "Adding remote repository..."
git remote add origin https://github.com/shaikyaseenSpyDev/SmartFinanceHub.git

# Step 7: Push to GitHub with force flag to overwrite any existing history
Write-Host "Pushing to GitHub with force flag..."
git branch -M main
git push -f -u origin main

Write-Host ""
Write-Host "Done! A fresh repository has been created and pushed to GitHub."
Write-Host "This repository should only show you as the contributor."
Write-Host "Visit: https://github.com/shaikyaseenSpyDev/SmartFinanceHub"
