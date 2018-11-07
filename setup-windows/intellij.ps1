$myConfigPath = (Split-Path -Parent $PSScriptRoot)

$configPath = (Join-Path $myConfigPath "ideavimrc");
if (-Not (Get-Item ~/.ideavimrc -ErrorAction SilentlyContinue)) {
    Write-Output "Creating link from ${configPath} to ~/.ideavimrc"
    New-Item -Path ~/.ideavimrc -ItemType SymbolicLink -Value $configPath | Out-Null
}
else {
    Write-Output "Skipping linking ~/.ideavimrc, it already exists."
}
