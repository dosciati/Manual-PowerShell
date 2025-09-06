# Verifica se está em sessão elevada (Admin/UAC)
$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal($identity)
if ($principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)) {
  Write-Host "Sessão elevada: Administrador" -ForegroundColor Green
} else {
  Write-Host "Não está elevado. Execute como Administrador." -ForegroundColor Yellow
}
