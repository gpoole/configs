#Requires -RunAsAdministrator
$myConfigPath = $PWD

$vimConfigPath = [io.path]::Combine($myConfigPath, "shared", "ideavimrc");
$vimTargetPath = (Join-Path $HOME ".ideavimrc")
if (-Not (Get-Item $vimTargetPath -ErrorAction SilentlyContinue)) {
  Write-Output "Creating link from ${vimConfigPath} to ${vimTargetPath}"
  New-Item -Path $vimTargetPath -ItemType SymbolicLink -Value $vimConfigPath | Out-Null
}
else {
  Write-Output "Skipping linking ${vimTargetPath}, it already exists."
}

$riderRoot = (Resolve-Path "$env:APPDATA\JetBrains\Rider*")
$colorsDir = (Join-Path $riderRoot "colors")
if (-Not (Get-Item $colorsDir -ErrorAction SilentlyContinue)) {
  New-Item -Path $colorsDir -ItemType Directory
}

# This scheme doesn't seem to be compatible with Rider, it's just here
# in case I get time to fix it later
$colorSchemeUrl = "https://raw.githubusercontent.com/adilosa/base16-jetbrains/master/colors/base16-classic-dark.icls"
$colorSchemeFile = (Split-Path -Leaf $colorSchemeUrl)
$colorSchemePath = (Join-Path $colorsDir $colorSchemeFile)
if (-Not (Get-Item $colorSchemePath -ErrorAction SilentlyContinue)) {
  Write-Output "Downloading $colorSchemeFile..."
  Invoke-WebRequest -UseBasicParsing -Uri $colorSchemeUrl | Select-Object -ExpandProperty Content > $colorSchemePath
}
else {
  Write-Output "Skipping download of $colorSchemeFile, already installed."
}

Write-Output "Done."
