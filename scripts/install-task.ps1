param(
  [string]$TaskName = "Grizzly GBP Daily Poster",
  [string]$PluginRoot = "C:\Users\carte\.codex\plugins\grizzly-gbp-poster",
  [string]$At = "08:00"
)

$ErrorActionPreference = "Stop"
$script = Join-Path $PluginRoot "scripts\run-daily.ps1"
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$script`""
$trigger = New-ScheduledTaskTrigger -Daily -At $At
$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive -RunLevel Limited
Register-ScheduledTask -TaskName $TaskName -Action $action -Trigger $trigger -Principal $principal -Force
Write-Host "Installed scheduled task '$TaskName' for $At daily."
