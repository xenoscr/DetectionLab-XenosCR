# Purpose: Installs chocolatey package manager, then installs custom utilities from Choco.

If (-not (Test-Path "C:\ProgramData\chocolatey")) {
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Installing Chocolatey"
  Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
} else {
  Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Chocolatey is already installed."
}

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Installing utilities..."
If ($(hostname) -eq "win10") {
  # Install Edge
  choco install -y --limit-output --no-progress microsoft-edge
}
choco install -y --limit-output --no-progress NotepadPlusPlus 7zip processhacker

Write-Host "$('[{0:HH:mm}]' -f (Get-Date)) Utilties installation complete!"
