# Scripting e Automação

## Parametrização e validação
```powershell
param(
  [Parameter(Mandatory)]
  [ValidateSet('dev','homolog','prod')]
  [string]$Ambiente
)
```

## Logging e erros
```powershell
$ErrorActionPreference = 'Stop'
try {
  # ...
} catch {
  Write-Error $_
}
```

## Execução agendada (Task Scheduler)
- Exportar `.ps1` e registrar tarefa com credenciais seguras.
