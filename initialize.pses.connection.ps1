while (!(Test-Path "$( $cfg.session )/session.json")) { Start-Sleep 1 }
$session = Get-PSESSession

$direction = [System.IO.Pipes.PipeDirection]::InOut
$options = [System.IO.Pipes.PipeOptions]::None
$level = [System.Security.Principal.TokenImpersonationLevel]::Impersonation
$name = $session.languageServicePipeName

$pipe = new-object System.IO.Pipes.NamedPipeClientStream ".", $name, $direction, $options, $level;
$null = $pipe.Connect(5000);
 
$writer = new-object System.IO.StreamWriter($pipe);
$reader = new-object System.IO.StreamReader($pipe);

$pipe;
$writer;
$reader;