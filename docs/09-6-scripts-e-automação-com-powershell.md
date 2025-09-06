# 6. Scripts e Automação com PowerShell

O PowerShell é amplamente reconhecido por suas poderosas capacidades de
scripting e automação. A criação de scripts no PowerShell permite que
tarefas repetitivas sejam automatizadas, resultando em maior eficiência
e precisão na administração de sistemas. Nesta seção, vamos explorar os
fundamentos da criação de scripts, técnicas avançadas de automação, e
como aplicar práticas recomendadas para desenvolver scripts robustos e
eficientes.

##### 6.1 Script Básico para Backup Diário

\# Define os caminhos de origem e destino

\$source = \"C:\\Caminho\\Para\\DiretorioOrigem\"

\$destination = \"D:\\Caminho\\Para\\DiretorioDestino\\backup\_\" +
(Get-Date -Format \"dd-MM-yyyy\")

\# Copia os arquivos do diretório de origem para o diretório de destino

Copy-Item -Path \$source\\\* -Destination \$destination -Recurse -Force

\# Cria uma entrada no log com a data e hora atuais

\$logMessage = \"Backup concluído em \" + (Get-Date -Format \"dd/MM/yyyy
HH:mm:ss\")

\$logPath = \"D:\\Caminho\\Para\\DiretorioDestino\\backup_log.txt\"

Add-Content -Path \$logPath -Value \$logMessage

> **6.1.1 Explicação Detalhada**
>
> **1. Definição dos Caminhos de Origem e Destino**

- \$source: Esta variável armazena o caminho do diretório de origem,
  onde os arquivos que serão copiados estão localizados.

- \$destination: Esta variável armazena o caminho do diretório de
  destino, onde os arquivos copiados serão armazenados. A variável
  Get-Date -Format \"dd-MM-yyyy\" é usada para adicionar a data atual ao
  nome do diretório de destino, criando uma pasta de backup com a data
  atual.

**Formato de Data**: A data é formatada como \"dd-MM-yyyy\", o que
resultará em algo como \"backup_22-07-2024\", dependendo da data em que
o script é executado.

1.  **Copiando os Arquivos do Diretório de Origem para o Diretório de
    Destino**

- **Copy-Item**: Este é o comando PowerShell usado para copiar arquivos
  e diretórios.

- **-Path \$source\\\***: Especifica o caminho de origem com um curinga
  (\*), o que significa que todos os arquivos e subdiretórios do
  diretório de origem serão copiados.

- **-Destination \$destination**: Especifica o caminho de destino onde
  os arquivos serão copiados.

- **-Recurse**: Esta opção permite que o comando copie recursivamente
  todos os subdiretórios e seus conteúdos.

- **-Force**: Esta opção força a cópia dos arquivos, substituindo
  arquivos no destino sem solicitar confirmação.

**Resultado**: Todos os arquivos e subdiretórios do diretório de origem
serão copiados para o diretório de destino, que inclui a data no nome.

#### **3. Registrando a Conclusão do Backup em um Arquivo de Log**

- \$logMessage: Esta variável armazena uma mensagem de log, que inclui a
  informação \"Backup concluído em \" seguida pela data e hora atual,
  formatada como \"dd/MM/yyyy HH:mm\".

- \$logPath: Esta variável armazena o caminho e nome do arquivo de log
  onde a mensagem será gravada.

- Add-Content: Este comando adiciona o conteúdo especificado (neste
  caso, a mensagem de log) ao final de um arquivo. Se o arquivo não
  existir, ele será criado.

> Resultado: Após a conclusão da cópia dos arquivos, o script registra
> no arquivo de log a data e hora em que o backup foi concluído.
>
> Funcionamento Geral do Script

- Propósito: O script é projetado para criar uma cópia de segurança dos
  arquivos de um diretório de origem para um diretório de destino, onde
  o diretório de destino inclui a data do backup no seu nome. Além
  disso, o script registra no log a data e hora em que o backup foi
  concluído.

- Automação: Este script pode ser agendado para ser executado
  automaticamente em intervalos regulares (por exemplo, diariamente)
  para garantir que backups regulares sejam feitos sem intervenção
  manual.

- Flexibilidade: Como o destino do backup é nomeado com a data, cada
  execução do script cria um novo diretório de backup, evitando
  sobrescrever backups anteriores e mantendo um histórico das cópias de
  segurança.

##### 6.2 Script para Limpeza de Arquivos Temporários

> \# Define o diretório temporário do sistema
>
> \$temp_dir = \$env:TEMP
>
> \# Exclui todos os arquivos no diretório temporário
>
> Get-ChildItem -Path \$temp_dir -Recurse -Force \| Remove-Item -Force
>
> \# Remove o próprio diretório temporário (e seu conteúdo se ainda
> houver algum)
>
> Remove-Item -Path \$temp_dir -Recurse -Force
>
> \# Registra a limpeza no log com a data e hora atuais
>
> \$logMessage = \"Diretório de arquivos temporários limpo em \" +
> (Get-Date -Format \"dd/MM/yyyy HH:mm:ss\")
>
> \$logPath = \"C:\\Logs\\temp_cleanup_log.txt\"
>
> Add-Content -Path \$logPath -Value \$logMessage
>
> **Explicação do Script**

1.  Definindo o Diretório Temporário:

- \$env:TEMP: Obtém o caminho do diretório temporário do sistema, que é
  armazenado na variável de ambiente TEMP.

2.  **Excluindo Todos os Arquivos no Diretório Temporário**:

>  Get-ChildItem -Path \$temp_dir -Recurse -Force: Lista todos os
> arquivos e subdiretórios no diretório temporário recursivamente,
> incluindo arquivos ocultos e de sistema.

- Remove-Item -Force: Exclui os arquivos e diretórios listados sem
  solicitar confirmação.

3.  **Removendo o Diretório Temporário**:

- Remove-Item -Path \$temp_dir -Recurse -Force: Remove o diretório
  temporário e qualquer conteúdo restante que não tenha sido excluído na
  etapa anterior.

4.  **Registrando a Limpeza no Log**:

- \$logMessage: Cria uma mensagem de log contendo a informação de que a
  limpeza foi concluída, juntamente com a data e hora atuais.

- Add-Content -Path \$logPath -Value \$logMessage: Adiciona a mensagem
  de log ao arquivo temp_cleanup_log.txt no diretório C:\\Logs. Se o
  arquivo não existir, ele será criado.

> **Funcionamento Geral do Script**

- **Objetivo**: Este script limpa o diretório temporário do sistema
  excluindo todos os arquivos e pastas dentro dele e, em seguida,
  registra a operação em um arquivo de log.

- **Automatização**: O script pode ser executado manualmente ou agendado
  para execução periódica para manter o diretório temporário limpo, o
  que pode ajudar a liberar espaço em disco e melhorar o desempenho do
  sistema.

- **Registro de Atividade**: Mantém um log das operações de limpeza,
  incluindo a data e hora em que foram realizadas, o que é útil para
  monitorar e auditar a manutenção do sistema.

##### 6.3 Script para Monitoramento de Logs do Event Viewer

> \# Define o caminho do arquivo de log
>
> \$logfile = \"C:\\Logs\\event_log.txt\"
>
> \# Extrai os últimos 10 eventos do log de Aplicações e salva no
> arquivo de log
>
> wevtutil qe Application /rd:true /f:text /c:10 \> \$logfile
>
> \# Adiciona uma linha no arquivo de log com a data e hora da
> monitorização
>
> \$logMessage = \"Logs monitorados em \" + (Get-Date -Format
> \"dd/MM/yyyy HH:mm:ss\")
>
> Add-Content -Path \$logfile -Value \$logMessage
>
> **Explicação do Script**

- \$logfile = \"C:\\Logs\\event_log.txt\": Define a variável \$logfile
  com o caminho onde o arquivo de log será salvo.

- wevtutil qe Application /rd /f /c:10 \> \$logfile **-** Usa o comando
  wevtutil para extrair os últimos 10 eventos do log de Aplicações do
  Event Viewer, formatados como texto, e salva a saída no arquivo de log
  especificado por \$logfile.

- \$logMessage = \"Logs monitorados em \" + (Get-Date -Format
  \"dd/MM/yyyy HH:mm"): Cria uma mensagem de log contendo a data e hora
  atuais.

- Add-Content **-**Path \$logfile -Value \$logMessage: Adiciona a
  mensagem de log ao final do arquivo, registrando quando os eventos
  foram monitorados.

##### 6.4 Backup de Documentos Pessoais

> \# Define o caminho da origem
>
> \$source = \"C:\\Users\\\[pasta_do_usuario\]\\Documentos\"
>
> \# Cria a pasta de destino com a data formatada
>
> \$destination = \"D:\\Backup\\Documentos\\backup\_\" + (Get-Date
> -Format \"dd-MM-yyyy\")
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
> \$logEntry = \"Backup de Documentos concluído em \" + (Get-Date
> -Format \"dd/MM/yyyy HH:mm:ss\") + \"\`r\`n\"
>
> Add-Content -Path \"D:\\Backup\\Documentos\\backup_log.txt\" -Value
> \$logEntry

Explicação dos comandos.

- **Formatação de data**: A formatação da data no PowerShell é feita
  usando Get-Date -Format \"formato\".

- **Test-Path e New-Item**: Esses comandos verificam se o diretório de
  destino já existe e, se não, criam o diretório.

- **Copy-Item**: É o comando usado para copiar arquivos e diretórios no
  PowerShell. A opção -Recurse garante que todas as subpastas e arquivos
  sejam copiados, e a opção -Force permite substituir arquivos
  existentes.

- **Add-Content**: Este comando adiciona a entrada de log ao arquivo
  especificado, criando-o se não existir.