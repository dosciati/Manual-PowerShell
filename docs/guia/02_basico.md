# Fundamentos e Básico

## Ajuda e descoberta
```powershell
Get-Help Get-Process -Online
Get-Command -Noun Service
Get-Module -ListAvailable
```

## Pipeline e objetos
```powershell
Get-Process | Where-Object CPU -gt 100 | Sort-Object CPU -Descending | Select-Object -First 10
```

## Providers e navegação
```powershell
Get-PSDrive
Set-Location HKLM:\Software
```

## Entrada/Saída
```powershell
Get-Content .\log.txt | Out-File .\log_filtrado.txt -Encoding utf8
```
