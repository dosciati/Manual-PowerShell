# Módulos e Pacotes

## Gerenciamento de módulos
```powershell
Find-Module PSScriptAnalyzer | Install-Module -Scope CurrentUser -Force
Import-Module PSScriptAnalyzer
Get-Command -Module PSScriptAnalyzer
```

## Criando seu próprio módulo
```powershell
New-ModuleManifest .\MyTools\MyTools.psd1
# Adicione funções em .psm1 e exporte via manifest
```
