$script:cfg = Get-Content ".\psqt.config.json" | Out-String | ConvertFrom-Json

. ".\initialize.pses.server.ps1"
. ".\define.getter.pses.session.ps1"

$script:continue = $true;

While( $continue ){

    Write-Host "PSES-tester> " -NoNewLine
    
    $query = $Host.UI.ReadLine()

    $command, $suffix = $query -split ":"
    $param = $suffix -join ":"
    $command = $command.Trim()

    Switch( $command ){

        "kill" { . ".\commands\kill.ps1" }
        "quit" { . ".\commands\quit.ps1" }
        "get-cfg" { . ".\commands\get-cfg.ps1" }
        default {
            Write-Host "Invalid input"
        }

    }

}