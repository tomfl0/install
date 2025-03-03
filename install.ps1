winget install Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements
winget install Schniz.fnm

# refresh env
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

code --install-extension esbenp.prettier-vscode
code --install-extension ritwickdey.LiveServer

# create powershell profile folder if it doesnt exist yet
mkdir $(Split-Path -Parent $PROFILE)

# load fnm in powershell
Write-Output "fnm env --shell powershell | out-string | iex" > $PROFILE
. $PROFILE

# install node
fnm install 22
fnm default 22
