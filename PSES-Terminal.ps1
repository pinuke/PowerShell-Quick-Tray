$script:server = & ".\initialize.pses.server.ps1"
$script:continue = $true;

. ".\define.getter.pses.session.ps1"

While( $continue ){

    Write-Host "PSES-tester> " -NoNewLine
    
    $query = $Host.UI.ReadLine()

    $command, $suffix = $query -split ":"
    $param = $suffix -join ":"
    $command = $command.Trim()

    Switch( $command ){

        "kill" {

            function Kill-Tree {
                Param([int]$ppid)
                Get-CimInstance Win32_Process | Where-Object { $_.ParentProcessId -eq $ppid } | ForEach-Object { Kill-Tree $_.ProcessId }
                Stop-Process -Id $ppid
                Write-Host "killing pid $ppid"
            }

            Kill-Tree( $server.Id )
            $continue = $false;
            Write-Host "`r`nServer Process Stopped via Kill-Tree ($( $server.id ))"

        }
        "quit" {

            $null = $server.CloseMainWindow()
            $continue = $false;
            Write-Host "Server Process Stopped via CloseMainWindow()"

        }
        "get-cfg" {

            $param = $param.Trim()

            Switch( $param ){

                "session" {

                    Write-Output ( Get-PSESSession )
                    
                }
                default {

                    Write-Host "Requested config not valid"

                }

            }

        }
        default {
            Write-Host "Invalid input"
        }

    }

}