function Kill-Tree {
    Param([int]$ppid)
    Get-CimInstance Win32_Process | Where-Object { $_.ParentProcessId -eq $ppid } | ForEach-Object { Kill-Tree $_.ProcessId }
    Stop-Process -Id $ppid
    Write-Host "killing pid $ppid"
}

Kill-Tree( $server.Id )
$continue = $false;
Write-Host "`r`nServer Process Stopped via Kill-Tree ($( $server.id ))"