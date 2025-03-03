winget install Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements

winget install Schniz.fnm
# refresh env
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Output "fnm env --shell powershell | out-string | iex" > $PROFILE
. $PROFILE
fnm install 22
fnm default 22


