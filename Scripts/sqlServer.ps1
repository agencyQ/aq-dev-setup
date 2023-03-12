choco install -y sql-server-2022

Invoke-Sqlcmd -Query "EXEC sp_configure 'contained', 1;" -ServerInstance localhost
Invoke-Sqlcmd -Query "RECONFIGURE;" -ServerInstance localhost
Invoke-Sqlcmd -Query "EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE', N'Software\Microsoft\MSSQLServer\MSSQLServer', N'LoginMode', REG_DWORD, 2" -ServerInstance localhost
Invoke-Sqlcmd -Query "ALTER LOGIN [sa] WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF" -ServerInstance localhost
Invoke-Sqlcmd -Query "ALTER LOGIN [sa] WITH PASSWORD=N'Password123!'" -ServerInstance localhost
Invoke-Sqlcmd -Query "ALTER LOGIN [sa] ENABLE" -ServerInstance localhost