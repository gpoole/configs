#Requires -RunAsAdministrator
choco install nvm
nvm install 12.16.1
nvm use 12.16.1
npm install --global --production windows-build-tools@4.0.0