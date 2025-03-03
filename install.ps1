set-executionpolicy RemoteSigned
winget install Microsoft.VisualStudioCode

winget install Schniz.fnm
echo "fnm env --shell powershell | out-string | iex" > $PROFILE
. $PROFILE
fnm install 22
fnm default 22


