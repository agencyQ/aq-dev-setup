$env:NVS_HOME = "$env:ProgramData\nvs"
New-Item -Path $env:NVS_HOME -Name "projects" -ItemType "directory"

Push-Location $env:NVS_HOME

try {
  git clone https://github.com/jasongin/nvs "$env:NVS_HOME"
  . "$env:NVS_HOME\nvs.ps1" install
  . "$env:NVS_HOME\nvs.ps1" add lts
  . "$env:NVS_HOME\nvs.ps1" use lts
}
catch {
  Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}
finally {
  Pop-Location
}