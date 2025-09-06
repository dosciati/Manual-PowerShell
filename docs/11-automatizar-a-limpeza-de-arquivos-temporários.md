# Automatizar a Limpeza de Arquivos Temporários

> **Exemplo 1: Manutenção de Sistema em um PC Pessoal**
>
> #Limpar o diretório Temp da pasta do usuário atual
>
> \# Define o diretório temporário
>
> \$temp_dir = \$env:TEMP
>
> \# Exclui todos os arquivos no diretório temporário
>
> Get-ChildItem -Path \$temp_dir\\\* -Recurse \| Remove-Item -Force
>
> \# Remove o diretório temporário e todas as subpastas
>
> Remove-Item -Path \$temp_dir -Recurse -Force
>
> \# Registra a data e a hora no log
>
> \$logEntry = \"Diretório de arquivos temporários limpo em \" +
> (Get-Date -Format \"dd/MM/yyyy HH:mm:ss\") + \"\`r\`n\"
>
> Add-Content -Path \"C:\\Logs\\temp_cleanup_log.txt\" -Value \$logEntry

Explicação do código.

- **Variável \$temp_dir**: O PowerShell usa \$env:TEMP para acessar a
  variável de ambiente TEMP.

- **Remoção de arquivos**: Get-ChildItem -Path \$temp_dir\\\* -Recurse
  \| Remove-Item -Force lista e remove todos os arquivos no diretório
  temporário, incluindo os arquivos em subpastas.

- **Remoção de diretório**: Remove-Item -Path \$temp_dir -Recurse -Force
  remove o diretório temporário e todas as subpastas.

- **Log**: Add-Content adiciona uma linha ao arquivo de log com a data e
  hora da limpeza.

> **Exemplo 2: Manutenção de Servidor de Arquivos**
>
> #Semelhante ao anterior porém para ser executado em rede, para
> servidores
>
> #Define o diretório temporário
>
> \$temp_dir = \$env:TEMP
>
> \# Exclui todos os arquivos no diretório temporário
>
> Get-ChildItem -Path \$temp_dir\\\* -Recurse \| Remove-Item -Force
>
> \# Remove o conteúdo do diretório temporário
>
> Get-ChildItem -Path \$temp_dir\\\* -Recurse \| Remove-Item -Recurse
> -Force
>
> \# Registra a data e a hora no log
>
> \$logEntry = \"Diretório de arquivos temporários limpo em \" +
> (Get-Date -Format \"dd/MM/yyyy HH:mm:ss\") + \"\`r\`n\"
>
> Add-Content -Path \"\\\\Servidor\\Logs\\temp_cleanup_log.txt\" -Value
> \$logEntry

- **Definição do diretório temporário**:

> A variável \$temp_dir é usada para armazenar o caminho para o
> diretório temporário (\$env:TEMP).

- **Remoção de arquivos**:

> Get-ChildItem -Path \$temp_dir\\\* -Recurse \| Remove-Item -Force
> lista todos os arquivos e subpastas no diretório temporário e os
> remove. A opção -Recurse garante que todos os arquivos em subpastas
> também sejam removidos.

- **Remoção de subpastas**:

> A remoção é feita de forma recursiva com Remove-Item -Recurse -Force,
> que remove os arquivos e pastas dentro do diretório temporário, mas
> não tenta remover o próprio diretório, pois ele é um diretório do
> sistema que será recriado automaticamente.

- **Registro em log**:

> O script adiciona uma entrada ao arquivo de log
> \\\\Servidor\\Logs\\temp_cleanup_log.txt, registrando a data e hora da
> limpeza.

#### Monitoramento e Registro do Uso de CPU e Memória

- **Exemplo 1: Monitoramento de Desempenho de um Servidor ou Desktop**

> \# Define o caminho do arquivo de log
>
> \$logfile = \"C:\\Logs\\server_usage_log.txt\"
>
> \# Função p ara formatar bytes em KB, MB, GB
>
> function Format-Size (\$size) {
>
> if (\$size -ge 1GB) {
>
> return \"{0:N2} GB\" -f (\$size / 1GB)
>
> }
>
> elseif (\$size -ge 1MB) {
>
> return \"{0:N2} MB\" -f (\$size / 1MB)
>
> }
>
> elseif (\$size -ge 1KB) {
>
> return \"{0:N2} KB\" -f (\$size / 1KB)
>
> }
>
> else {
>
> return \"\$size Bytes\"
>
> }
>
> }
>
> \# Função para formatar o tempo de CPU em horas, minutos e segundos
>
> function Format-CPUTime (\$cpuTime) {
>
> \$timespan = \[TimeSpan\]::FromSeconds(\$cpuTime)
>
> return \$timespan.ToString(\"hh\\:mm\\:ss\")
>
> }
>
> \# Loop infinito
>
> while (\$true) {
>
> \# Adiciona a data e a hora ao log e exibe na tela
>
> \$timestamp = Get-Date -Format \"dd/MM/yyyy HH:mm:ss\"
>
> Write-Host \$timestamp
>
> \$timestamp \| Out-File -FilePath \$logfile -Append
>
> \# Obtém os 10 processos que mais consomem CPU e formata WS, PM e CPU
>
> \$processInfo = Get-Process \| Sort-Object CPU -Descending \|
> Select-Object -First 10 \| ForEach-Object {
>
> \[PSCustomObject\]@{
>
> Name = \$\_.Name
>
> CPU = Format-CPUTime \$\_.CPU
>
> WS = Format-Size \$\_.WorkingSet
>
> PM = Format-Size \$\_.PagedMemorySize
>
> }
>
> } \| Format-Table -AutoSize \| Out-String -Width 512
>
> \# Exibe na tela e registra no log
>
> Write-Host \$processInfo
>
> \$processInfo \| Out-File -FilePath \$logfile -Append
>
> \# Adiciona uma linha em branco ao log e exibe na tela
>
> \"\`r\`n\" \| Out-File -FilePath \$logfile -Append
>
> Write-Host \"\"
>
> \# Aguarda 300 segundos (5 minutos)
>
> Start-Sleep -Seconds 300

#### Desfragmentação de Disco Automatizada

- **Exemplo 1: Manutenção de Disco Rígido em um PC Pessoal**

> \# Define o caminho do arquivo de log
>
> \$logfile = \"C:\\Logs\\defrag_log.txt\"
>
> \# Executa o comando de desfragmentação no drive C: e registra o
> output no log
>
> Start-Process -FilePath \"defrag.exe\" -ArgumentList \"C:\", \"/U\",
> \"/V\" -NoNewWindow -RedirectStandardOutput \$logfile -Wait