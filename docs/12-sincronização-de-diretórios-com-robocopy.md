# Sincronização de Diretórios com Robocopy

- **Exemplo 1: Sincronização de Diretórios Entre Computadores**

> \# Define os caminhos de origem e destino
>
> \$source = \"C:\\Trabalho\"
>
> \$destination = \"\\\\OfficePC\\Trabalho\" \# Deve definir para qual
> destino será sincronizado o conteúdo da pasta trabalho
>
> \# Define o caminho do arquivo de log
>
> \$logfile = \"C:\\Logs\\robocopy_log.txt\"
>
> \# Executa o comando Robocopy com os parâmetros especificados
>
> Start-Process -FilePath \"robocopy.exe\" -ArgumentList \"\$source\",
> \"\$destination\", \"/MIR\", \"/R:5\", \"/W:10\", \"/LOG:\$logfile\"
> -NoNewWindow -Wait

Exemplo 2: Backup Incremental de Arquivos

> \# Define os caminhos de origem e destino
>
> \$source = \"C:\\Projetos\"
>
> \$destination = \"D:\\Backup\\Projetos\"
>
> \# Define o caminho do arquivo de log
>
> \$logfile = \"C:\\Logs\\backup_incremental_log.txt\"
>
> \# Executa o comando Robocopy com os parâmetros especificados
>
> Start-Process -FilePath \"robocopy.exe\" -ArgumentList \"\$source\",
> \"\$destination\", \"/MIR\", \"/R:5\", \"/W:10\", \"/LOG:\$logfile\"
> -NoNewWindow -Wait
>
> Explicação do script

- o destino (\$destination) é ajustado para um disco local,
  D:\\Backup\\Projetos, em vez de um caminho de rede.

<!-- -->

- **Outras partes do script**:

- As variáveis \$source e \$logfile continuam definindo os caminhos de
  origem e de log, respectivamente.

- O comando Start-Process chama robocopy.exe com os mesmos parâmetros:

  - /MIR: Mantém o espelho da origem no destino.

  - /R:5: Tenta repetir a cópia até 5 vezes em caso de falha.

  - /W:10: Aguarda 10 segundos entre tentativas.

  - /LOG:\$logfile: Registra a saída em um arquivo de log.

- -NoNewWindow e -Wait garantem que o processo seja executado na mesma
  janela e o script espere pela conclusão.