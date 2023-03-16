Enable-WindowsOptionalFeature -Online -FeatureName containers -All

choco install docker-desktop -y


Set-NetConnectionProfile -interfacealias "vEthernet (DockerNAT)" -NetworkCategory Private
New-NetFirewallRule -DisplayName "Docker Containers" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 0-65535 -RemotePort 0-65535 -LocalAddress 172.16.0.0/12 -RemoteAddress 172.16.0.0/12