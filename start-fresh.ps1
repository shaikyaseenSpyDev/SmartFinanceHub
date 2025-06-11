# PowerShell script to completely reset Git repository and push to a new remote
# This removes all traces of previous contributors

# Step 1: Backup important files (in case something goes wrong)
Write-Host "Creating backup of important files..."
$tempFolder = "..\temp_backup_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
New-Item -ItemType Directory -Path $tempFolder -Force | Out-Null
Copy-Item -Path "*" -Destination $tempFolder -Recurse -Force
Write-Host "Backup created at: $tempFolder"

# Step 2: Completely remove the Git repository
Write-Host "Removing existing Git repository..."
Remove-Item -Path ".git" -Recurse -Force

# Step 3: Create a fresh Git repository
Write-Host "Creating a fresh Git repository..."
git init

# Step 4: Update README.md to remove mentions of original author
Write-Host "Updating README.md..."
$readmePath = "README.md"
if (Test-Path $readmePath) {
    $readmeContent = Get-Content -Path $readmePath -Raw
    $readmeContent = $readmeContent -replace "Hardik Singh Behl", "SpyDev"
    $readmeContent = $readmeContent -replace "hardikSinghBehl", "shaikyaseenSpyDev"
    $readmeContent = $readmeContent -replace "hardik\.behl", "shaikyaseen"
    Set-Content -Path $readmePath -Value $readmeContent
}

# Step 5: Configure Git user
Write-Host "Configuring Git user..."
git config user.name "shaikyaseenSpyDev"
git config user.email "shaikyaseensy737@gmail.com"

# Step 6: Add all files to staging
Write-Host "Adding all files to staging..."
git add .

# Step 7: Create initial commit
Write-Host "Creating initial commit..."
git commit -m "Initial commit: SmartFinanceHub by SpyDev"

# Step 8: Add the remote repository
Write-Host "Adding remote repository..."
git remote add origin https://github.com/shaikyaseenSpyDev/SmartFinanceHub.git

# Step 9: Push to GitHub
Write-Host "Pushing to GitHub..."
git branch -M main
git push -f -u origin main

Write-Host ""
Write-Host "====================================="
Write-Host "REPOSITORY RESET COMPLETE"
Write-Host "====================================="
Write-Host "Your code has been pushed to GitHub with a completely fresh history."
Write-Host "Only you should now appear as a contributor."
Write-Host "Repository URL: https://github.com/shaikyaseenSpyDev/SmartFinanceHub"
