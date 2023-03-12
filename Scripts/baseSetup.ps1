choco install -y git
refreshenv

choco install -y vscode
refreshenv

choco install -y googlechrome
choco install -y firefox
choco install -y notepadplusplus
choco install -y 7zip.install
choco install -y adobereader
choco install -y filezilla
choco install -y beyondcompare
choco install -y winmerge
choco install -y microsoftazurestorageexplorer
choco install -y postman


try {

  if (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer")) { New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Type Folder | Out-Null }
  if (!(Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState")) { New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" -Type Folder | Out-Null }
  if (!(Test-Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search")) { New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Type Folder | Out-Null }

  # Explorer: Show hidden files by default: Show Files: 1, Hide Files: 2
  Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Hidden" 1

  # Explorer: Show file extensions by default: Hide: 1, Show: 0
  Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0

  # Explorer: Show path in title bar: Hide: 0, Show: 1
  Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" "FullPath" 1

  # Explorer: Disable creating Thumbs.db files on network volumes: Enable: 0, Disable: 1
  Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" "DisableThumbnailsOnNetworkFolders" 1

  # Taskbar: Hide the Search, Task, Widget, and Chat buttons: Show: 1, Hide: 0
  Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" "SearchboxTaskbarMode" 0  # Search
  Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ShowTaskViewButton" 0 # Task
  Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarDa" 0 # Widgets
  Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarMn" 0 # Chat


  # will expand explorer to the actual folder you're in
  Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneExpandToCurrentFolder -Value 1
  #adds things back in your left pane like recycle bin
  Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name NavPaneShowAllFolders -Value 1
  #opens PC to This PC, not quick access
  Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name LaunchTo -Value 1
  #taskbar where window is open for multi-monitor
  Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2
}
catch {
  Write-Host "Error setting Windows Explorer Options" -ForegroundColor "Red"
}

New-Item -Path "c:\" -Name "projects" -ItemType "directory"
New-Item -Path "c:\" -Name "license" -ItemType "directory"