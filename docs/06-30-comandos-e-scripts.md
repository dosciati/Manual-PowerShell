# 3.0 Comandos e Scripts

> **Introdução aos Comandos e Scripts no PowerShell**
>
> No PowerShell, os comandos e scripts são os blocos de construção
> fundamentais para automatizar tarefas, gerenciar sistemas e realizar
> operações complexas de forma eficiente. Comandos são instruções
> individuais que você executa no shell, enquanto scripts são coleções
> de comandos agrupados em um arquivo para serem executados como uma
> unidade.
>
> **Comandos**
>
> **Cmdlets**
>
> Cmdlets são comandos embutidos no PowerShell, projetados para executar
> uma tarefa específica. Como discutido anteriormente, os cmdlets seguem
> a convenção de nomenclatura Verbo-Substantivo e são usados para uma
> ampla gama de tarefas, como gerenciamento de arquivos, processos,
> serviços, registros e mais.
>
> **Exemplos de Cmdlets Comuns**:

- Get-Process : Obtém informações sobre processos em execução.

<!-- -->

- Stop-Service: Interrompe um serviço.

- Set-Item: Define o valor de um item.

- Get-EventLog: Obtém entradas de um log de eventos.

> **Alias**
>
> Alias são nomes alternativos para cmdlets ou comandos. Eles permitem
> que você use versões abreviadas ou mais familiares de comandos, o que
> pode ser útil para quem vem de outros ambientes de linha de comando.
>
> **Exemplos de Alias**:

- ls: Alias para Get-ChildItem.

- cd: Alias para Set-Location.

- cp: Alias para Copy-Item.

- rm: Alias para Remove-Item.

> Você pode ver todos os alias disponíveis usando o comando:
>
> get-alias
>
> **Funções**
>
> Funções são blocos de código reutilizáveis que você pode definir
> dentro do PowerShell para executar tarefas específicas. Elas permitem
> encapsular lógica complexa em um comando simples que pode ser
> reutilizado.
>
> **Exemplo de Definição de Função**:
>
> function Get-Greeting {
>
> param (
>
> \[string\]\$Name
>
> )
>
> \"Hello, \$Name! Welcome to PowerShell.\"
>
> }
>
> \# Usar a função
>
> Get-Greeting -Name \"Maria\"
>
> **Scripts**
>
> Scripts no PowerShell são arquivos de texto que contêm uma sequência
> de comandos e são salvos com a extensão .ps1. Eles permitem a
> automação de tarefas complexas e repetitivas, proporcionando um meio
> de executar vários comandos de uma vez.
>
> **Criando e Executando Scripts**
>
> **Passos para Criar um Script**:

1.  Abra um editor de texto (como Notepad ou Visual Studio Code).

2.  Escreva os comandos que deseja executar.

3.  Salve o arquivo com a extensão .ps1 (por exemplo, meuScript.ps1).

> \# Script: greetings.ps1
>
> \$nome = \"Carlos\"
>
> \$saudacao = \"Olá, \$nome! Bem-vindo ao PowerShell.\"
>
> Write-Output \$saudacao
>
> \# Listar processos em execução
>
> Get-Process
>
> **Executando o Script**: Para executar um script, abra o PowerShell e
> navegue até o diretório onde o script está salvo, então execute o
> script usando: **.\\greetings.ps1**
>
> **Configurações de Execução**
>
> O PowerShell possui uma política de execução de scripts que determina
> quais scripts podem ser executados em um sistema. As políticas de
> execução mais comuns são:

- Restricted: Nenhum script pode ser executado. Esta é a configuração
  padrão.

<!-- -->

- AllSigned: Somente scripts assinados digitalmente podem ser
  executados.

- RemoteSigned: Scripts baixados da internet precisam ser assinados
  digitalmente, mas scripts locais podem ser executados sem assinatura.

- Unrestricted: Todos os scripts podem ser executados, mas scripts
  baixados da internet exigem confirmação.

> Você pode verificar e alterar a política de execução usando os
> seguintes comandos:
>
> **Verificar a Política de Execução**:
>
> Get-ExecutionPolicy
>
> **Alterar a Política de Execução (por exemplo, para RemoteSigned)**:
>
> Set-ExecutionPolicy RemoteSigned
>
> **Parâmetros e Argumentos**
>
> Scripts e funções no PowerShell podem aceitar parâmetros e argumentos,
> permitindo que você passe valores dinâmicos e personalize a execução.
>
> **Exemplo de Script com Parâmetros**:
>
> \# Script: backup.ps1
>
> param (
>
> \[string\]\$SourcePath,
>
> \[string\]\$DestinationPath
>
> )
>
> Copy-Item -Path \$SourcePath -Destination \$DestinationPath -Recurse
>
> Write-Output \"Backup completed from \$SourcePath to
> \$DestinationPath.\"
>
> Para executar o script com parâmetros:
>
> .\\backup.ps1 -SourcePath \"C:\\Dados\" -DestinationPath
> \"D:\\Backup\"
>
> O que este script faz:

- param: Define os parâmetros que o script pode receber quando for
  executado.

- \[string\]\$SourcePath: Este parâmetro representa o caminho de origem
  (source path), ou seja, o diretório ou arquivo que será copiado. O
  tipo de dado é string, indicando que espera-se um caminho de arquivo
  ou pasta como uma cadeia de caracteres.

- \[string\]\$DestinationPath: Este parâmetro representa o caminho de
  destino (destination path), para onde os arquivos ou diretórios serão
  copiados. Também é uma string.

- Copy-Item: Cmdlet usado para copiar arquivos e diretórios.

- -Path \$SourcePath: Especifica o caminho de origem dos arquivos ou
  diretórios que serão copiados.

- -Destination \$DestinationPath: Especifica o caminho de destino para
  onde os arquivos ou diretórios serão copiados.

- -Recurse: Este parâmetro é utilizado para copiar o conteúdo de forma
  recursiva, ou seja, ele copia todos os subdiretórios e seus conteúdos
  dentro do diretório de origem.

- Write-Output: Cmdlet que envia uma mensagem para a saída padrão,
  geralmente exibida no console.

- **Mensagem**: A mensagem \"Backup completed from \$SourcePath to
  \$DestinationPath.\" é exibida para informar ao usuário que a cópia de
  segurança foi concluída com sucesso. Os valores de \$SourcePath e
  \$DestinationPath são interpolados na string para mostrar os caminhos
  específicos usados na operação.

> **Estruturas de Controle em Scripts**
>
> Scripts no PowerShell podem incluir estruturas de controle como loops
> (for, foreach, while) e condicionais (if, else, switch) para executar
> operações repetitivas e tomar decisões.
>
> **Exemplo de Estrutura Condicional**:
>
> \$valor = 10
>
> if (\$valor -gt 5) {
>
> Write-Output \"O valor é maior que 5.\"
>
> } else {
>
> Write-Output \"O valor é 5 ou menor.\"
>
> }
>
> **Exemplo de Loop**:
>
> for (\$i = 1; \$i -le 5; \$i++) {
>
> Write-Output \"Contagem: \$i\"
>
> }
>
> **Exemplos Práticos de Scripts**
>
> **Exemplo 1: Script de Backup Automático**
>
> param (
>
> \[string\]\$SourceDir,
>
> \[string\]\$BackupDir
>
> )
>
> if (-not (Test-Path \$BackupDir)) {
>
> New-Item -ItemType Directory -Path \$BackupDir
>
> }
>
> Copy-Item -Path \$SourceDir -Destination \$BackupDir -Recurse
>
> Write-Output \"Backup from \$SourceDir to \$BackupDir completed.\"
>
> **Exemplo 2: Script para Verificar o Uso de CPU de Processos**
>
> \$processos = Get-Process \| Where-Object { \$\_.CPU -gt 100 }
>
> foreach (\$processo in \$processos) {
>
> Write-Output \"Processo: \$(\$processo.Name) - CPU:
> \$(\$processo.CPU)\"
>
> }

##### 3.1. Trabalhando com Arquivos e Diretórios

> O PowerShell oferece uma série de cmdlets e funcionalidades para
> manipular arquivos e diretórios. Com esses comandos, você pode criar,
> copiar, mover, excluir, e listar arquivos e pastas de maneira
> eficiente.
>
> **Navegação em Diretórios**

- **Get-Location (alias: pwd)**: Exibe o diretório atual em que você
  está navegando.

Get-Location

- **Set-Location (alias: cd)**: Altera o diretório atual.

Set-Location -Path \"C:\\Users\\SeuUsuario\\Documentos\"

- **Push-Location** e **Pop-Location**: Permitem alternar
  temporariamente para um diretório diferente e retornar ao original.

Push-Location \"C:\\Windows\"

\# Fazer algo no diretório C:\\Windows

Pop-Location

> ![](media/image5.png){width="4.052951662292213in"
> height="1.0305413385826772in"}
>
> **Manipulação de Arquivos e Diretórios**

- **Get-ChildItem (alias: ls, dir)**: Lista arquivos e diretórios em um
  local específico.

Get-ChildItem -Path \"C:\\Users\\andre\\Documentos\"

- **New-Item**: Cria novos arquivos ou diretórios.

\# Criar um diretório

New-Item -Path \"C:\\Users\\SeuUsuario\\Documentos\\NovaPasta\"
-ItemType Directory

\# Criar um arquivo de texto

New-Item -Path \"C:\\Users\\SeuUsuario\\Documentos\\NovoArquivo.txt\"
-ItemType File

- **Copy-Item (alias: cp)**: Copia arquivos ou diretórios.

Copy-Item -Path \"C:\\Fonte\\Arquivo.txt\" -Destination
\"C:\\Destino\\Arquivo.txt\"

- **Move-Item (alias: mv)**: Move ou renomeia arquivos e diretórios.

Move-Item -Path \"C:\\Fonte\\Arquivo.txt\" -Destination
\"C:\\Destino\\Arquivo.txt\"

- **Remove-Item (alias: rm, del)**: Remove (exclui) arquivos ou
  diretórios.

Remove-Item -Path
\"C:\\Users\\SeuUsuario\\Documentos\\ArquivoParaExcluir.txt\"

> **Leitura e Escrita de Arquivos**

- **Get-Content (alias: gc)**: Lê o conteúdo de um arquivo.

Get-Content -Path \"C:\\Users\\SeuUsuario\\Documentos\\Arquivo.txt\"

- **Set-Content**: Escreve ou substitui o conteúdo de um arquivo.

Set-Content -Path \"C:\\Users\\SeuUsuario\\Documentos\\Arquivo.txt\"
-Value \"Novo conteúdo\"

- **Add-Content**: Adiciona texto ao final de um arquivo existente.

> Add-Content -Path \"C:\\Users\\SeuUsuario\\Documentos\\Arquivo.txt\"
> -Value \"Texto adicional\"

- **Out-File**: Redireciona a saída de um comando para um arquivo.

Get-Process \| Out-File -FilePath
C:\\Users\\SeuUsuario\\Documentos\\Processos.txt\"

##### 3.2. Controle de Fluxo

> O controle de fluxo no PowerShell permite que você controle a lógica
> dos scripts e comandos, definindo como e quando determinadas seções de
> código serão executadas.
>
> **Estruturas Condicionais**

- **if, elseif, else**: Executa comandos com base em condições.

\$idade = 20

if (\$idade -ge 18) {

Write-Output \"Você é maior de idade.\"

} elseif (\$idade -lt 18 -and \$idade -ge 12) {

Write-Output \"Você é adolescente.\"

} else {

Write-Output \"Você é uma criança.\"

}

- **switch**: Avalia uma expressão uma vez e executa o bloco de código
  correspondente.

\$diaDaSemana = \"Segunda-feira\"

switch (\$diaDaSemana) {

\"Segunda-feira\" { Write-Output \"Início da semana.\" }

\"Sexta-feira\" { Write-Output \"Quase fim de semana.\" }

\"Sábado\" { Write-Output \"Fim de semana!\" }

Default { Write-Output \"Dia normal.\" }

}

> **Loops**

- **for**: Executa um bloco de código repetidamente com base em uma
  condição.

for (\$i = 0; \$i -lt 5; \$i++) {

Write-Output \"Contagem: \$i\"

}

- **foreach**: Itera sobre cada item em uma coleção.

> \$nomes = @(\"Ana\", \"Bruno\", \"Carlos\")
>
> foreach (\$nome in \$nomes) {
>
> Write-Output \"Olá, \$nome!\"
>
> }

- **while**: Executa um bloco de código enquanto uma condição for
  verdadeira.

\$contador = 0

while (\$contador -lt 3) {

Write-Output \"Contagem: \$contador\"

\$contador++

}

- **do\...while**: Similar ao while, mas a condição é verificada após a
  execução do bloco.

> \$contador = 0
>
> do {
>
> Write-Output \"Contagem: \$contador\"
>
> \$contador++
>
> } while (\$contador -lt 3)

**Manipulação de Exceções**

- **try, catch, finally**: Usados para capturar e tratar erros durante a
  execução de comandos.

try {

\$resultado = 1 / 0 \# Gera um erro de divisão por zero

} catch {

Write-Output \"Erro capturado: \$\_\"

} finally {

Write-Output \"Execução concluída.\"

}

##### 3.3. Funções e Scripts

Funções e scripts são fundamentais para reutilizar código e automatizar
tarefas repetitivas no PowerShell.

**Funções**

As funções permitem encapsular blocos de código que podem ser chamados
repetidamente em um script ou sessão. Elas podem receber parâmetros e
retornar valores.

**Definindo Funções**:

function Saudacao {

param (

\[string\]\$Nome,

\[int\]\$Idade

)

return \"Olá, \$Nome! Você tem \$Idade anos.\"

}

\# Chamando a função

\$mensagem = Saudacao -Nome \"Lucas\" -Idade 30

Write-Output \$mensagem

**Funções Avançadas**: Funções avançadas no PowerShell são semelhantes a
cmdlets e podem utilizar recursos como parâmetros obrigatórios,
validação de entrada e suporte a pipelines.

function Get-MaiorNumero {

\[CmdletBinding()\]

param (

\[Parameter(Mandatory=\$true)\]

\[int\[\]\]\$Numeros

)

return (\$Numeros \| Measure-Object -Maximum).Maximum

}

\# Usando a função avançada

\$maiorNumero = Get-MaiorNumero -Numeros @(10, 20, 30)

Write-Output \"O maior número é: \$maiorNumero\"

**Scripts**

Scripts no PowerShell são arquivos que contêm uma sequência de comandos
e funções, permitindo automatizar tarefas complexas.

**Criando e Executando Scripts**:

- Um script é simplesmente um arquivo .ps1 que contém comandos do
  PowerShell.

- Para criar um script, abra um editor de texto, escreva os comandos e
  salve o arquivo com a extensão .ps1.

**Exemplo de Script**:

\# Script: backup.ps1

param (

\[string\]\$SourceDir,

\[string\]\$BackupDir

)

if (-not (Test-Path \$BackupDir)) {

New-Item -ItemType Directory -Path \$BackupDir

}

Copy-Item -Path \$SourceDir -Destination \$BackupDir -Recurse

Write-Output \"Backup realizado de \$SourceDir para \$BackupDir\"

**Executando o Script**:

.\\backup.ps1 -SourceDir \"C:\\Dados\" -BackupDir \"D:\\Backup\"

**Passando Parâmetros para Scripts**: Scripts podem aceitar parâmetros
para permitir que sejam mais flexíveis e reutilizáveis.

\# Script: saudacao.ps1

param (

\[string\]\$Nome = \"Visitante\",

\[int\]\$Idade = 25

)

Write-Output \"Olá, \$Nome! Você tem \$Idade anos.\"

**Executando com Parâmetros**:

.\\saudacao.ps1 -Nome \"João\" -Idade 40

**Modularizando Scripts**

À medida que seus scripts crescem em tamanho e complexidade, é uma boa
prática modularizar o código, dividindo-o em funções e scripts menores e
reutilizáveis.

**Importando Funções de Outros Scripts**:

\# Importa as funções de um script externo

. .\\funcoes.ps1

\# Agora você pode usar as funções importadas

MinhaFuncao -Parametro1 \"Valor\"