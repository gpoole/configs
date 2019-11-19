#Requires -RunAsAdministrator
Import-Module (Resolve-Path(Join-Path $PSScriptRoot "Util.psm1")) -Force

# TODO: add install bug.n
Write-Output "NOTE: This doesn't install bug.n, only configures it."

New-ConfigLink windows/bugn.ini ([IO.Path]::Combine($env:APPDATA, "bug.n", "Config.ini"))