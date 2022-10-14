$param = $param.Trim()

Switch( $param ){

    "session" {

        Write-Output ( Get-PSESSession )
        
    }
    default {

        Write-Host "Requested config not valid"

    }

}