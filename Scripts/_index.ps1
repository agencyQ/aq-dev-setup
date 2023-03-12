$scriptBaseUrl = 'https://raw.githubusercontent.com/agencyQ/aq-dev-setup/main/Scripts/'

function runscript {
  Param ([string]$scriptUrl)

  try {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString($scriptUrl))
    refreshenv 
  }
  catch {
    Write-Host "Failure in script $scriptUrl"
    Write-Host $_.Exception.Message -ForegroundColor "Red"
  }
}


runscript "https://community.chocolatey.org/install.ps1"
runscript "$scriptBaseUrl/removeDefaultApps.ps1"
runscript "$scriptBaseUrl/SystemSettings.ps1"
runscript "$scriptBaseUrl/baseSetup.ps1"
runscript "$scriptBaseUrl/nodeDevelopment.ps1"
runscript "$scriptBaseUrl/visualStudio.ps1"

                            