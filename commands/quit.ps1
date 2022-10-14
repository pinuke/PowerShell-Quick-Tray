. ".\commands\disconnect.ps1"

$null = $server.CloseMainWindow()
$continue = $false;
Write-Host "Server Process Stopped via CloseMainWindow()"