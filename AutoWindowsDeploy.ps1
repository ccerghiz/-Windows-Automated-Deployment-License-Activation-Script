param(
    [Parameter(Mandatory = $true)]
    [string]$ISOPath = "C:\path\to\windows.iso",     # Path to the Windows ISO file
    [Parameter(Mandatory = $true)]
    [string]$XMLPath = "C:\path\to\unattended.xml", # Path to the unattended.xml configuration file
    [Parameter(Mandatory = $true)]
    [string]$ProductKey = "YOUR-WINDOWS-KEY"        # Your Windows product key
)

# Check if ISO file exists
if (!(Test-Path -Path $ISOPath)) {
    Write-Error "ISO file not found at $ISOPath"
    exit
}

# Mount ISO
Write-Host "Mounting ISO..."
Mount-DiskImage -ImagePath $ISOPath -ErrorAction Stop

# Wait for the ISO to load
Start-Sleep -Seconds 3

# Get the drive letter of the mounted ISO
$volume = Get-DiskImage -ImagePath $ISOPath | Get-Volume
$driveLetter = $volume.DriveLetter

if (!$driveLetter) {
    Write-Error "Couldn't identify the drive letter of the mounted ISO."
    exit
}

Write-Host "ISO mounted on drive $driveLetter:`"

# Start Windows setup with unattended.xml
Write-Host "Starting Windows setup..."
Start-Process -FilePath "$driveLetter`:\setup.exe" -ArgumentList "/unattend:$XMLPath" -Wait

# Activate Windows license
Write-Host "Activating Windows..."
Start-Process -FilePath "slmgr.vbs" -ArgumentList "/ipk $ProductKey" -Wait
Start-Process -FilePath "slmgr.vbs" -ArgumentList "/ato" -Wait

# Dismount ISO
Write-Host "Dismounting ISO..."
Dismount-DiskImage -ImagePath $ISOPath

Write-Host "Deployment completed successfully!"

