Write-Host "Checking if Python is installed..."

$pythonPath = (Get-Command python -ErrorAction SilentlyContinue)
if (-not $pythonPath) {
    Write-Host "Python not found. Downloading and installing Python..."
    
    $pythonInstallerUrl = "https://www.python.org/ftp/python/3.11.2/python-3.11.2-amd64.exe"
    $installerFile = "$env:TEMP\python-installer.exe"

    (New-Object System.Net.WebClient).DownloadFile($pythonInstallerUrl, $installerFile)

    Start-Process $installerFile -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait

    Remove-Item $installerFile -Force
}
else {
    Write-Host "Python is already installed."
}

Write-Host "Upgrading pip and installing dependencies..."

python -m pip install --upgrade pip
python -m pip install requests keyboard

Write-Host "All done installing Python and dependencies."

$scriptPath = Join-Path $PSScriptRoot "trigger.py"

Write-Host "Now running $scriptPath ..."
Start-Process python.exe -ArgumentList "`"$scriptPath`""