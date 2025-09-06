# 6.5 Backup de Projetos de Desenvolvimento

> \# Define o caminho da origem
>
> \$source = \"C:\\Desenvolvimento\\Projetos\"
>
> \# Cria a pasta de destino com a data formatada
>
> \$destination = \"\\\\Servidor\\Backups\\Projetos\\backup\_\" +
> (Get-Date -Format \"dd-MM-yyyy\")
>
> \# Verifica se a pasta de destino existe, se não, cria a pasta
>
> if (-not (Test-Path -Path \$destination)) {
>
> New-Item -ItemType Directory -Path \$destination
>
> }
>
> \# Copia os arquivos da origem para o destino, incluindo subpastas e
> arquivos ocultos
>
> Copy-Item -Path \$source\\\* -Destination \$destination -Recurse
> -Force
>
> \# Registra a data e a hora no log
>
> \$logEntry = \"Backup de Projetos concluído em \" + (Get-Date -Format
> \"dd/MM/yyyy HH:mm:ss\") + \"\`r\`n\"
>
> Add-Content -Path \"\\\\Servidor\\Backups\\Projetos\\backup_log.txt\"
> -Value \$logEntry
>
> Explicação dos comandos

- **Variáveis**: \$source e \$destination armazenam os caminhos de
  origem e destino.

- **Formatação da data**: Usamos Get-Date -Format \"dd-MM-yyyy\" para
  formatar a data na criação da pasta de backup.

- **Test-Path e New-Item**: Verifica se o diretório de destino existe e
  cria-o se necessário.

- **Copy-Item**: Este comando copia todos os arquivos e subpastas do
  diretório de origem para o diretório de destino, incluindo arquivos
  ocultos.

- **Add-Content**: Adiciona uma linha ao arquivo de log com a data e
  hora da conclusão do backup.