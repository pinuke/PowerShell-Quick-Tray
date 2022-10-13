$PSES_BUNDLE_PATH = "C:\#\bin\PowerShellEditorServices"
$SESSION_TEMP_PATH = "C:\#\src\PowerShell-Quick-Tray\session\"

$command = @(
    "$PSES_BUNDLE_PATH/PowerShellEditorServices/Start-EditorServices.ps1",
        "-BundledModulesPath $PSES_BUNDLE_PATH",
        "-LogPath $SESSION_TEMP_PATH/logs.log",
        "-SessionDetailsPath $SESSION_TEMP_PATH/session.json",
        "-FeatureFlags @()",
        "-AdditionalModules @()",
        "-HostName 'My Client'",
        "-HostProfileId 'myclient'",
        "-HostVersion 1.0.0",
        "-LogLevel Normal"
)-join " "

pwsh -NoLogo -NoProfile -Command $command