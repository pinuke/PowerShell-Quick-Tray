function Get-PSESSession(){

    $parsed = Get-Content "$( $cfg.session )\session.json" | Out-String | ConvertFrom-Json
    $properties = $parsed | Get-Member -MemberType NoteProperty
    $filtered = $properties | Where{ $_.Name -match "PipeName`$" }

    $filtered | ForEach-Object{

        $pipename = ( $_.Definition -split "\\" ) | select -last 1
        $parsed."$( $_.Name )" = $pipename

    }

    $parsed

}
