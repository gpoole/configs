#Requires -RunAsAdministrator
$installRoot = "$env:APPDATA\Code\User\"
$myConfigPath = $PWD

function Add-Config {
  $source, $target = $args
  $fullTargetPath = (Join-Path $installRoot $target)
  Remove-Item -Force -ErrorAction SilentlyContinue -Path $fullTargetPath
  New-Item -Path $fullTargetPath -ItemType SymbolicLink -Value (Join-Path $myConfigPath $source)
}

Add-Config "shared\vscode-settings.json" "settings.json"
Add-Config "shared\vscode-keybindings.json" "keybindings.json"

Push-Location (Join-Path $myConfigPath "shared\")
Get-Content vscode-*.txt | ForEach-Object {
  code --install-extension $_
}
Pop-Location