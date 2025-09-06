# Exportação de Políticas de Segurança para Backup

> Este script deve ser salvo em um arquivo com extensão ps1 e executado
> como administrador do sistema.

\# Define o caminho do diretório de backup e do arquivo de configuração

\$backupDir = \"C:\\Backup\"

\$cfgFile = \"\$backupDir\\secpol.cfg\"

\# Verifica se o diretório de backup existe; se não existir, cria o
diretório

if (-Not (Test-Path -Path \$backupDir)) {

try {

New-Item -Path \$backupDir -ItemType Directory -ErrorAction Stop \|
Out-Null

Write-Host \"Diretório de backup criado: \$backupDir\"

} catch {

Write-Host \"Erro ao criar o diretório de backup: \$\_\"
-ForegroundColor Red

Exit

}

}

\# Exporta as configurações de segurança para o arquivo .cfg

try {

Start-Process -FilePath \"secedit.exe\" -ArgumentList \"/export /cfg
\$cfgFile\" -NoNewWindow -Wait -ErrorAction Stop

if (Test-Path -Path \$cfgFile) {

Write-Host \"Configurações de segurança exportadas com sucesso para:
\$cfgFile\"

} else {

Write-Host \"Falha na exportação das configurações de segurança. O
arquivo não foi criado.\" -ForegroundColor Red

Exit

}

} catch {

Write-Host \"Erro ao exportar as configurações de segurança: \$\_\"
-ForegroundColor Red

Exit

}

\# Registra a exportação das configurações de segurança no log com a
data e hora atuais

\$logMessage = \"Configurações de segurança exportadas em \" + (Get-Date
-Format \"dd/MM/yyyy HH:mm:ss\")

\$logPath = \"C:\\Logs\\secpol_export_log.txt\"

Add-Content -Path \$logPath -Value \$logMessage

Write-Host \"Operação registrada no log: \$logPath\"

## Backup do registro do Windows

\# Define o caminho para o backup do registro e o log

\$regBackupFile = \"C:\\Backup\\registro_backup.reg\"

\$logFile = \"C:\\Logs\\registry_backup_log.txt\"

\# Verifica e cria o diretório de backup se necessário

if (-Not (Test-Path -Path \"C:\\Backup\")) {

New-Item -Path \"C:\\Backup\" -ItemType Directory \| Out-Null

}

\# Faz o backup de todo o registro

reg export HKLM \$regBackupFile /y

\# Registra a operação no log

\$logMessage = \"Backup geral do registro realizado em \" + (Get-Date
-Format \"dd/MM/yyyy HH:mm:ss\")

Add-Content -Path \$logFile -Value \$logMessage

## Restauração do Backup do registro do Windows

\# Define o caminho para o arquivo de backup do registro

\$regBackupFile = \"C:\\Backup\\registro_backup.reg\"

\$logFile = \"C:\\Logs\\registry_restore_log.txt\"

\# Verifica se o arquivo de backup existe

if (Test-Path -Path \$regBackupFile) {

try {

\# Restaura o registro a partir do backup

reg import \$regBackupFile

\# Registra a operação no log

\$logMessage = \"Restauração do registro realizada em \" + (Get-Date
-Format \"dd/MM/yyyy HH:mm:ss\")

Add-Content -Path \$logFile -Value \$logMessage

Write-Host \"Restauração do registro concluída com sucesso.\"

} catch {

Write-Host \"Erro ao restaurar o registro: \$\_\" -ForegroundColor Red

}

} else {

Write-Host \"Arquivo de backup do registro não encontrado:
\$regBackupFile\" -ForegroundColor Red

}