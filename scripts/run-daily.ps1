param(
  [string]$PluginRoot = "C:\Users\carte\.codex\plugins\grizzly-gbp-poster"
)

$ErrorActionPreference = "Stop"
Set-Location -LiteralPath $PluginRoot
$BundledPython = "C:\Users\carte\.cache\codex-runtimes\codex-primary-runtime\dependencies\python\python.exe"
if (Test-Path -LiteralPath $BundledPython) {
  & $BundledPython "$PluginRoot\scripts\grizzly_gbp.py" run-daily
} else {
  python "$PluginRoot\scripts\grizzly_gbp.py" run-daily
}
