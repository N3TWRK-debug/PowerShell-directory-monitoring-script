Add-Type -AssemblyName PresentationCore, PresentationFramework

# Set the target directory
$directory = ""

# Start monitoring
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $directory
$watcher.Filter = "*.exe" # Use filter for specific file types
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

# Define event handler
Register-ObjectEvent $watcher "Created" -Action {
    $message = "A new file has appeared in the directory" 
    $wsh = New-Object -ComObject Wscript.Shell
    $wsh.Popup($message, 0, "New File Found", 64)
}

# Start an infinite loop to keep the script running
while ($true) {
    Start-Sleep -Seconds 1
}
