# Verificação e Correção de Erros no Disco

- **Exemplo 1: Manutenção Preventiva em um PC Pessoal**

> \# Verifica se o script está sendo executado como administrador
>
> If (-Not (\[Security.Principal.WindowsPrincipal\]
> \[Security.Principal.WindowsIdentity\]::GetCurrent()).IsInRole(\[Security.Principal.WindowsBuiltInRole\]
> \"Administrator\"))
>
> {
>
> Write-Host \"Este script precisa ser executado como administrador. Por
> favor, execute o PowerShell com privilégios elevados.\"
> -ForegroundColor Red
>
> Exit
>
> }
>
> \# Executa o comando CHKDSK no drive C: e registra a saída no log
>
> Start-Process -FilePath \"chkdsk.exe\" -ArgumentList \"C: /F /R\"
> -NoNewWindow -RedirectStandardOutput \"C:\\Logs\\chkdsk_log.txt\"