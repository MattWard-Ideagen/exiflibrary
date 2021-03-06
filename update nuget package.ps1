Param(
     [Parameter(Mandatory=$true, HelpMessage="NuGet API Key")][String]$apikey
   )

$ScriptDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$PkgDir = Join-Path $ScriptDir '.\ExifLibrary\bin\Release' -Resolve
Set-Location $PkgDir

$args = @('nuget', 'push', '.\*.nupkg', '-s', 'https://www.nuget.org', '-k', $apikey)
& 'dotnet' $args
