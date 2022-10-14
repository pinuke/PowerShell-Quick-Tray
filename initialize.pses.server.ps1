$script:cfg = Get-Content ".\psqt.config.json" | Out-String | ConvertFrom-Json

$script:command = @(
    "$( $cfg.bundle )/PowerShellEditorServices/Start-EditorServices.ps1",
        "-BundledModulesPath $( $cfg.bundle )",
        "-LogPath $( $cfg.session )/logs.log",
        "-SessionDetailsPath $( $cfg.session )/session.json",
        "-FeatureFlags @()",
        "-AdditionalModules @()",
        "-HostName 'My Client'",
        "-HostProfileId 'myclient'",
        "-HostVersion 1.0.0",
        "-LogLevel Normal"
)-join " "

$script:arguments = "-NoLogo -NoProfile -Command $command"

Start-Process pwsh -ArgumentList $arguments -WindowStyle Minimized -PassThru