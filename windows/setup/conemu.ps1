pushd $env:TEMP
git clone https://github.com/martinlindhe/base16-conemu
cd base16-conemu
.\Install-ConEmuTheme.ps1 -Operation Add -ThemePathOrName .\themes\base16-oceanicnext.xml
popd
echo "You will need to select 'Base 16 Oceanic Next' in the theme settings"