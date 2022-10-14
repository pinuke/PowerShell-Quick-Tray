$script:arguments = & { 
    
    $command = @(
        "$( $cfg.bundle )/PowerShellEditorServices/Start-EditorServices.ps1",
            "-BundledModulesPath $( $cfg.bundle )",
            "-LogPath $( $cfg.session )/logs.log",
            "-SessionDetailsPath $( $cfg.session )/session.json",
            "-FeatureFlags @()",
            "-AdditionalModules @()",
            "-HostName 'My Client'",
            "-HostProfileId 'myclient'",
            "-HostVersion 1.0.0",
            "-LogLevel Diagnostic"
    )-join " "

    return "-NoLogo -NoProfile -Command $command"

}

$script:server = Start-Process pwsh -ArgumentList $arguments -WindowStyle Minimized -PassThru