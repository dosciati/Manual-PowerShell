# Lista softwares instalados via registro (x64/x86)
$paths = @(
  'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
  'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'
)
$apps = foreach ($p in $paths) {
  if (Test-Path $p) {
    Get-ChildItem $p | ForEach-Object { Get-ItemProperty $_.PsPath } |
      Where-Object { $_.DisplayName } |
      Select-Object DisplayName, DisplayVersion, Publisher, InstallDate
  }
}
$apps | Sort-Object DisplayName | Format-Table -AutoSize
