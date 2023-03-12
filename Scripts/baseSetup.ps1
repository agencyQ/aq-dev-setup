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

New-Item -Path "c:\" -Name "projects" -ItemType "directory"
New-Item -Path "c:\" -Name "license" -ItemType "directory"