# Criação de Ponto de Restauração do Sistema

- **Exemplo 1: Criação Automática de Pontos de Restauração Antes de
  Instalar Atualizações**

> \# Cria um ponto de restauração do sistema com a descrição
> especificada
>
> Checkpoint-Computer -Description \'Antes da Atualização\'
> -RestorePointType \'MODIFY_SETTINGS\'
>
> \# Registra a criação do ponto de restauração no arquivo de log
>
> \$timestamp = Get-Date -Format \"dd/MM/yyyy HH:mm:ss\"
>
> \$logMessage = \"Ponto de restauração criado antes da atualização em
> \$timestamp\"
>
> \$logMessage \| Out-File -FilePath \"C:\\Logs\\restore_point_log.txt\"
> -Append

#### Script para Backup Compactador de Fotos

> \# Define os caminhos de origem e destino
>
> \$source = \"C:\\Fotos\"
>
> \$destination = \"D:\\Backup\\Fotos\\backup\_\" + (Get-Date -Format
> \"dd-MM-yyyy\") + \".zip\"
>
> \# Compacta os arquivos do diretório de origem para o arquivo zip de
> destino
>
> Compress-Archive -Path \"\$source\\\*\" -DestinationPath \$destination
>
> \# Registra a operação no arquivo de log com a data e hora atuais
>
> \$logMessage = \"Fotos compactadas em \" + (Get-Date -Format
> \"dd/MM/yyyy HH:mm:ss\")
>
> \$logPath = \"D:\\Backup\\Fotos\\backup_log.txt\"
>
> Add-Content -Path \$logPath -Value \$logMessage
>
> **Explicação do Script.**

1.  **Definindo os Caminhos de Origem e Destino**:

    - \$source = \"C:\\Fotos\": Define o diretório de origem onde as
      fotos estão localizadas.

    - \$destination = \"D:\\Backup\\Fotos\\backup\_\" + (Get-Date
      -Format \"dd-MM-yyyy\") + \".zip\": Define o caminho de destino
      para o arquivo compactado (.zip), com a data atual incluída no
      nome do arquivo.

2.  **Compactação dos Arquivos**:

    - Compress-Archive -Path \"\$source\\\*\" -DestinationPath
      \$destination: Usa o comando Compress-Archive para compactar todos
      os arquivos e subdiretórios do diretório de origem em um arquivo
      .zip no diretório de destino especificado.

3.  **Registro da Operação no Log**:

    - \$logMessage = \"Fotos compactadas em \" + (Get-Date -Format
      \"dd/MM/yyyy HH:mm:ss\"): Cria uma mensagem de log que inclui a
      data e hora em que a compactação foi concluída.

    - \$logPath = \"D:\\Backup\\Fotos\\backup_log.txt\": Define o
      caminho onde o arquivo de log será salvo.

    - Add-Content -Path \$logPath -Value \$logMessage: Adiciona a
      mensagem de log ao arquivo backup_log.txt.