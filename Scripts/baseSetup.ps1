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
choco install -y github-desktop



try {


  Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions

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