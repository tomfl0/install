# To allow sourcing the pwsh profile later
Set-ExecutionPolicy RemoteSigned

winget install Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements
winget install Schniz.fnm
winget install Git.Git

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

# add vscode shortcut
$vsCodePath = "$env:LOCALAPPDATA\Programs\Microsoft VS Code\Code.exe"
$desktop = [System.Environment]::GetFolderPath("Desktop")
$shortcutPath = [System.IO.Path]::Combine($desktop, "Visual Studio Code.lnk")

if (!(Test-Path $vsCodePath)) {
    Write-Host "VS Code exe not found, can't create shortcut"
    exit 1
}

$wss = New-Object -ComObject WScript.Shell
$shortcut = $wss.CreateShortcut($shortcutPath)

$shortcut.TargetPath = $vsCodePath
$shortcut.WorkingDirectory = $(Split-Path -Parent $vsCodePath)
$shortcut.Save()

Write-Host "Created shortcut"

# Clone project & install deps
Set-Location $desktop
git clone https://github.com/tomfl0/workshop
Set-Location workshop
npm install
code .