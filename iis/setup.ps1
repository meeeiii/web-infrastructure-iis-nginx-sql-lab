# IIS setup script — Windows Server 2022, runs in elevated PowerShell.
# Reproduces the IIS build end-to-end.

# 1. Install the IIS role with the default features plus the management console.
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# 2. Create the three content folders.
$root = 'C:\inetpub'
'oakomolafe6433HQsite','oakomolafe6433Logo','oakomolafe6433Music' | ForEach-Object {
    New-Item -ItemType Directory -Force -Path (Join-Path $root $_) | Out-Null
}

# 3. Drop a minimal index.html into each.
$pages = @{
    'oakomolafe6433HQsite' = '<h1>HQ Website oakomolafe6433</h1><p>This page is served over HTTPS by IIS on Windows Server 2022.</p>'
    'oakomolafe6433Logo'   = '<h1>Logo Website oakomolafe6433</h1><p>This is my corporate logo site.</p>'
    'oakomolafe6433Music'  = '<h1>Music Website oakomolafe6433</h1><p>This is my music site.</p>'
}
foreach ($folder in $pages.Keys) {
    Set-Content -Path (Join-Path $root "$folder\index.html") -Value $pages[$folder] -Encoding UTF8
}

# 4. Point the Default Web Site at the HQ folder.
Import-Module WebAdministration
Set-ItemProperty 'IIS:\Sites\Default Web Site' -name PhysicalPath -value 'C:\inetpub\oakomolafe6433HQsite'

# 5. Add the two virtual directories.
New-WebVirtualDirectory -Site 'Default Web Site' -Name 'oakomolafe6433Logo'  -PhysicalPath 'C:\inetpub\oakomolafe6433Logo'
New-WebVirtualDirectory -Site 'Default Web Site' -Name 'oakomolafe6433Music' -PhysicalPath 'C:\inetpub\oakomolafe6433Music'

# 6. Self-signed certificate and HTTPS binding.
$cert = New-SelfSignedCertificate -DnsName 'localhost' -CertStoreLocation 'cert:\LocalMachine\My' -FriendlyName 'IIS-HQ-SelfSigned'
New-WebBinding -Name 'Default Web Site' -Protocol https -Port 443 -SslFlags 0
Get-ChildItem "IIS:\SslBindings\!443" | Remove-Item -Force -ErrorAction SilentlyContinue
New-Item "IIS:\SslBindings\!443" -Value $cert | Out-Null

# 7. Restart IIS so every change is live.
iisreset
