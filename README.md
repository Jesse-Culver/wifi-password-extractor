# wifi-password-extractor

A modified version of Exploitech's wifi-password-extractor.

## Use this only on systems in which you have permission to do so!

### How to use

1. Open up SystemDriver.PS1 in a text editor and change out GmailUsername and GmailPassword for your accounts
    Note: You need to enable "Less Secure App Access" https://myaccount.google.com/security
2. Copy the contents of SystemDriver.PS1 and use a Base64 Converter like [CyberChef](https://gchq.github.io/CyberChef/) to get a Base64 blob that you will host somewhere that can be downloaded as a RAW txt file like Pastebin
3. Inside of Explorer.PS1 put the URL from Step 2 in
4. Execute Explorer.PS1 however you see fit, probably with a Rubber Ducky/Bash Bunny

Now uses Remove-Item to clean up after itself, original version left files behind in the Recycle Bin.
I didn't care for the extra steps involved for encrypting/decrypting with the batch file so I simplified it. Now it downloads the Base64 blob to a txt and decodes it as a PS1.
I also added support to grab the wlan drivers so you can see what hardware you are dealing with and if it's capable of hosting a hotspot. Figured it might be handy if you want to setup an evil twin access point or if you want to setup your own private Wi-Fi entry point into the network.
