# PowerShell script to commit and push to a new GitHub repository
# Created by SpyDev

# Step 1: Initialize a Git repository if not already done
if (-not (Test-Path -Path ".git")) {
    Write-Host "Initializing a new Git repository..."
    git init
} else {
    Write-Host "Git repository already exists."
}

# Step 2: Configure Git user information
Write-Host "Configuring Git user information..."
git config user.name "shaikyaseenSpyDev"
git config user.email "shaikyaseensy737@gmail.com"

# Step 3: Add all files to staging
Write-Host "Adding all files to staging..."
git add .

# Step 4: Commit changes
Write-Host "Committing changes..."
git commit -m "Initial commit: Smart Finance Hub by SpyDev"

# Step 5: Check if remote already exists
$remoteExists = git remote -v | Select-String -Pattern "origin"
if ($remoteExists) {
    Write-Host "Remote 'origin' already exists. Removing it..."
    git remote remove origin
}

# Step 6: Add remote repository URL
Write-Host "Adding remote repository..."
git remote add origin https://github.com/shaikyaseenSpyDev/SmartFinanceHub.git

# Step 7: Rename master branch to main if needed (GitHub default is main)
git branch -M main

# Step 8: Push to GitHub
Write-Host "Pushing to GitHub..."
git push -u origin main

Write-Host ""
Write-Host "Done! Your code has been pushed to GitHub repository: SmartFinanceHub"
Write-Host "Visit: https://github.com/shaikyaseenSpyDev/SmartFinanceHub"
