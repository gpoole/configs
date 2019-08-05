#Requires -RunAsAdministrator
param(
    [string]$installRoot = $HOME
)
$myConfigPath = (Split-Path -Parent $PSScriptRoot)

$configPath = (Join-Path $myConfigPath "ideavimrc");
$targetPath = (Join-Path $installRoot ".ideavimrc")
if (-Not (Get-Item $targetPath -ErrorAction SilentlyContinue)) {
    Write-Output "Creating link from ${configPath} to ${targetPath}"
    New-Item -Path $targetPath -ItemType SymbolicLink -Value $configPath | Out-Null
}
else {
    Write-Output "Skipping linking ${targetPath}, it already exists."
}
