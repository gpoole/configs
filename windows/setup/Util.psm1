#Requires -RunAsAdministrator
$myConfigPath = (Split-Path -Parent $PSScriptRoot)

function New-ConfigLink {
  param(
    [string]$sourcePath,
    [string]$destPath
  )
  $fullSourcePath = (Join-Path $myConfigPath $sourcePath)
  $dir = (Split-Path -Parent $destPath)
  if (-Not (Test-Path $dir)) {
    New-Item -Path $dir -ItemType Directory
  }
  Remove-Item -Force -ErrorAction SilentlyContinue -Path $destPath
  New-Item -Path $destPath -ItemType SymbolicLink -Value $fullSourcePath
}

Export-ModuleMember -Function New-ConfigLink