# Ripped from:
# https://hodgkins.io/ultimate-powershell-prompt-and-git-setup

function Test-Administrator {
  $user = [Security.Principal.WindowsIdentity]::GetCurrent();
  (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

function prompt {
  $realLASTEXITCODE = $LASTEXITCODE

  Write-Host

  if (Test-Administrator) {
    # Use different username if elevated
    Write-Host "(Elevated) " -NoNewline -ForegroundColor White
  }

  Write-Host "$ENV:USERNAME@" -NoNewline -ForegroundColor DarkYellow
  Write-Host "$ENV:COMPUTERNAME" -NoNewline -ForegroundColor Magenta

  Write-Host " : " -NoNewline -ForegroundColor DarkGray
  Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\', '\\'), "~") -NoNewline -ForegroundColor Blue
  Write-Host " : " -NoNewline -ForegroundColor DarkGray
  Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
  Write-Host " : " -NoNewline -ForegroundColor DarkGray

  $global:LASTEXITCODE = $realLASTEXITCODE

  Write-Host ""

  return "> "
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
