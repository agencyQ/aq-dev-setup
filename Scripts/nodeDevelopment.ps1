choco install -y nvm
refreshenv

$env:NVM_HOME = "$env:ProgramData\nvm"

try {
  Push-Location $env:NVM_HOME

  .\nvm.exe install lts
  .\nvm.exe use lts
}
catch {
  Write-Output "Failed to install node LTS"
}
finally {
  Pop-Location
}