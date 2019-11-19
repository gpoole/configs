#Requires -RunAsAdministrator
$myConfigPath = $PWD

Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
Install-PackageProvider NuGet
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

if (!(Test-Path -Path $PROFILE)) {
  New-Item -ItemType SymbolicLink -Path $PROFILE -Value $myConfigPath\windows\profile.ps1
}