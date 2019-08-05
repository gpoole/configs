$installRoot = "$env:APPDATA\Code\User\"
$myConfigPath = (Split-Path -Parent $PSScriptRoot)

function Add-Config {
  $source, $target = $args
  $fullTargetPath = (Join-Path $installRoot $target)
  Remove-Item -Force -ErrorAction SilentlyContinue -Path $fullTargetPath
  New-Item -Path $fullTargetPath -ItemType SymbolicLink -Value (Join-Path $myConfigPath $source)
}

Add-Config "vscode-settings.json" "settings.json"
Add-Config "vscode-keybindings.json" "keybindings.json"

code --install-extension ms-vscode.csharp
code --install-extension ms-vscode.powershell
code --install-extension vscodevim.vim
code --install-extension golf1052.base16-generator
