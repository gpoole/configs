cat shared/vscode-*.txt | sort | unique > $env:TEMP/vscode-proposed.txt
code --list-extensions | sort > $env:TEMP/vscode-current.txt
code --diff $env:TEMP/vscode-current.txt $env:TEMP/vscode-proposed.txt

