# aq-dev-setup

## Basic Initial Setup

```pwsh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/agencyQ/aq-dev-setup/main/Scripts/_index.ps1'))
```
