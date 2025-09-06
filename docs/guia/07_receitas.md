# Receitas e Exemplos (extraídos da apostila)

## Bloco 1

1 Sumário  
Fundamentos do PowerShell ................................ ................................ ................................ .........  2 
1.2. Instalação e Configuração  ................................ ................................ ................................ ...... 2 
Ubuntu:  ................................ ................................ ................................ ................................ .........  3 
2 CentOS  ................................ ................................ ................................ ................................ ........  3 
1.3. Interface do PowerShell  ................................ ................................ ................................ .........  3 
3.0 Comandos e Scripts  ................................ ................................ ................................ ...............  10 
4. Administração de Sistemas com PowerShell  ................................ ................................ ...........  17 
5. Gerenciamento de processos  ................................ ................................ ................................ .. 20 
Cenários de Uso  ................................ ................................ ................................ ...............  22 
6. Scripts e Automação com PowerShell  ................................ ................................ .....................  23 
6.5 Backup de Projetos de Desenvolvimento  ................................ ................................ ..............  26 
Automatizar a Limpeza de Arquivos Temporários  ................................ ................................ .......  27 
Sincronização de Diretórios com Robocopy  ................................ ................................ ................  29 
Criação de Ponto de Restauração do Sistema  ................................ ................................ .............  29 
Verificação e Correção de Erros no Disco  ................................ ................................ ....................  30 
Exportação de Políticas de Segurança para Backup  ................................ ................................ .... 31 
Backup do registro do Windows  ................................ ................................ .............................  31 
Restauração do Backup do registro do Windows  ................................ ................................ .... 31 
Recursos Adicionais  ................................ ................................ ................................ .....................  32

## Bloco 2

Para criar ou editar um perfil:  
1. Abra o PowerShell.  
2. Verifique se o perfil existe com: Test-Path $PROFILE  
3. Se não existir, crie o perfil com: New-Item -Path $PROFILE  -Type  File -Force  
4. Edite o perfil com: notepad  $PROFILE (Windows) ou nano  $PROFILE (macOS/Linux).  
5. Adicione comandos, alias ou funções que deseja executar ao iniciar o PowerShell.  
1.3. Interface do PowerShell  
PowerShell Console vs. PowerShell ISE vs. Visual Studio Code

## Bloco 3

4 PowerShell Console  
• Interface padrão de linha de comando.  
• Utilizada principalmente para execução rápida de comandos e scripts.  
PowerShell ISE (Integrated Scripting Environment)  
• Ambiente de desenvolvimento integrado específico para PowerShell.  
• Oferece recursos como destaque de sintaxe, depuração e execução de scripts.  
• Ideal para escrever e testar scripts PowerShell.  
Visual Studio Code  
• Editor de código leve e extensível, suportando múltiplas linguagens.  
• Possui extensão PowerShell para suporte completo à linguagem.  
• Recomendado para desenvolvimento avançado de scripts e módulos PowerShell devido 
a suas capacidades de integração e personalização.  
Navegação Básica na Interface  
PowerShell Console e ISE  
• Executar Comandos : Digite um comando e pressione Enter.  
• Histórico de Comandos : Use as setas para cima e para baixo para navegar pelos 
comandos anteriores.  
• Autocompletar : Use a tecla Tab para autocompletar comandos e parâmetros.  
Visual Studio Code  
• Abrir Terminal : Ctrl + ' para abrir o terminal integrado.  
• Executar Scripts : Abra o arquivo .ps1 e pressione F5 para executar.  
• Extensão PowerShell : Instale a extensão PowerShell para suporte avançado, como 
autocompletar, depuração e formatação de código.  
2.1. Cmdlets e Sintaxe Básica  
Estrutura dos Cmdlets (Verbo -Substantivo)  
Os cmdlets (pronunciado "command -lets") são os comandos utilizados no PowerShell. Eles 
seguem uma convenção de nomenclatura consistente que facilita a leitura e a compreensão dos 
scripts. Cada cmdlet é estruturado no formato "Verbo -Substantivo".  
Verbo -Substantivo  
Verbo : Representa a ação a ser realizada. Alguns verbos comuns incluem  ➔ Get, Set, New, 
Remove, Start, Stop.  
Substantivo : Indica o objeto no qual a ação será realizada. Exemplo:  ➔Process, Service , 
Item, content.  
Exemplos de Cmdlets : 
• Get-Process: Obtém informações sobre processos em execução.  
• Set-Item: Define o valor de um item.  
• New-Item: Cria um novo item, como um arquivo ou pasta.  
• Remove -Service : Remove um serviço.  
Execução de Cmdlets  Básicos

## Bloco 4

```powershell
 5 Get-Help  O cmdlet Get -Help é utilizado para obter informações detalhadas sobre outros cmdlets 
e suas sintaxes. É uma ferramenta essencial para aprender a usar cmdlets e entender suas 
opções.  
Exemplo : 
Get-Help Get-Process  
Parâmetros Úteis : 
• -Detailed: Fornece uma descrição detalhada do cmdlet.  
• -Examples: Exibe exemplos de como usar o cmdlet.  
• -Full: Exibe toda a documentação disponível para o cmdlet.  
Get-Help Get-Process  -Examples  
```

## Bloco 5

```powershell
Get-Command  O cmdlet Get -Command lista todos os cmdlets, funções, aliases e scripts 
disponíveis na sessão atual do PowerShell. É útil para descobrir comandos que podem ser 
usados.  
• Exemplo : 
Get-Command  
• Filtrar por Verbo : 
Get-Command  -Verb  Get  
• Filtrar por Substantivo : 
Get-Command  -Noun  Process  
```

## Bloco 6

```powershell
Get-Member  O cmdlet Get -Member exibe as propriedades e métodos dos objetos. É usado para 
explorar e entender os tipos de objetos que os cmdlets retornam.  
• Exemplo : 
Get-Process  | Get-Member  
• Descrição : 
o Get-Process  obtém uma lista de processos em execução.  
o | (pipe) passa a saída de Get-Process  como entrada para Get-Member.   
o Get-Member  exibe as propriedades (como Id, Name, CPU ) e métodos (como 
Kill, Start ) dos objetos de processo.  
Exemplos Práticos  
Exemplo 1: Listar todos os processos em execução  
```

## Bloco 7

2.2. Objetos e Pipeline  
Modelo Baseado em Objetos  
Diferentemente de outras ferramentas de linha de comando que retornam texto simples, o 
PowerShell utiliza um modelo baseado em objetos. Isso significa que os cmdlets do 
PowerShell retornam objetos .NET, proporcionando uma maneira rica e estruturada de 
mani pular dados.  
Objetos .NET  
• Propriedades : Atributos que descrevem as características de um objeto. Por exemplo, 
um objeto Process pode ter propriedades como Id, Name e CPU.  
• Métodos : Ações que podem ser realizadas em um objeto. Por exemplo, um objeto 
Process pode ter métodos como Kill() e Start().  
Exemplo de Retorno de Objeto  
O cmdlet Get-Process retorna objetos Process  que têm várias propriedades e métodos 
associados.  
$process  = Get-Process  -Name  "notepad"

## Bloco 8

```powershell
Pipeline  
O pipeline é um dos conceitos mais poderosos do PowerShell. Ele permite encadear cmdlets  
de maneira que a saída de um cmdlet seja passada como entrada para o próximo cmdlet. 
Isso facilita o processamento e manipulação de dados de maneira sequencial.  
Operador de Pipeline (|)  
• O operador de pipeline (|) é usado para conectar cmdlets.  
• A saída de um cmdlet é passada como entrada para o cmdlet seguinte no pipeline.  
Exemplo Simples de Pipeline  
• Listar os processos em execução e selecionar apenas os processos que estão 
consumindo mais de 100MB de memória.  
Get-Process  | Where -Object  { $_.WorkingSet -gt 100MB  }  
o Get-Process : Obtém a lista de processos em execução.  
o |: Passa a saída do Get-Process  para o próximo cmdlet.  
o Where -Object  { $_.WorkingSet -gt 100MB  }: Filtra os processos com uso de 
memória superior a 100MB. O $_ representa o objeto atual no pipeline.  
Exemplo de Pipeline com Vários Cmdlets  
• Obter os nomes de todos os serviços em execução e ordená -los alfabeticamente.  
Get-Service  | Where -Object  { $_.Status -eq 'Running'  } | Sort-Object  -Property  Name  | Select -
Object  -Property  Name  
o Get-Service : Obtém a lista de serviços.  
o Where -Object  { $_.Status -eq 'Running'  }: Filtra os serviços que estão em 
execução.  
o Sort-Object  -Property  Name : Ordena os serviços pelo nome.  
o Select -Object  -Property  Name : Seleciona apenas a propriedade Name dos 
serviços.  
Trabalhando com Propriedades e Métodos  
• Para exibir as propriedades de um objeto no pipeline, use o cmdlet Select -Object.  
Get-Process  | Select -Object  -Property  Name , Id, CPU  
Para invocar métodos em objetos no pipeline, use o cmdlet ForEach -Object.  
Get-Process  | ForEach -Object  {  
    [PSCustomObject ]@{ 
        ProcessName = $_.Name  
        PID = $_.Id 
        MemoryUsageMB = [math ]::Round( $_.WorkingSet64 / 1MB, 2) 
    } 
} | Format -Table  -AutoSize  
```

## Bloco 9

```powershell
 8 Exemplo 1: Obter detalhes de processos específicos  
Get-Process  -Name  "explorer"  | Select -Object  -Property  Name , Id, CPU , StartTime  
```

## Bloco 10

```powershell
Exemplo 2: Listar serviços e exibir apenas o nome e status  
Get-Service  | Select -Object  -Property  Name , Status  
```

## Bloco 11

```powershell
Exemplo 3: Filtrar arquivos em um diretório por tamanho e ordenar por nome  
Get-ChildItem  -Path "C:\Logs"  | Where -Object  { $_.Length -gt 1MB } | Sort-Object  -Property  
Name  
```

## Bloco 12

```powershell
Exemplo 4: Reiniciar serviços que estão parados  
Get-Service  | Where -Object  {$.Status  -eq 'Stopped'  } | ForEach -Object  { $_.Start() }  
```

## Bloco 13

3.0 Comandos e Scripts  
Introdução aos Comandos e Scripts no PowerShell  
No PowerShell , os comandos e scripts são os blocos de construção fundamentais para 
automatizar tarefas, gerenciar sistemas e realizar operações complexas de forma eficiente. 
Comandos são instruções individuais que você executa no shell, enquanto scripts são 
coleções de  comandos agrupados em um arquivo para serem executados como uma 
unidade.  
Comandos  
Cmdlets  
Cmdlets são comandos embutidos no PowerShell , projetados para executar uma tarefa 
específica. Como discutido anteriormente, os cmdlets seguem a convenção de 
nomenclatura Verbo -Substantivo e são usados para uma ampla gama de tarefas, como 
gerenciamento de arquivos, processos, serviços, registros e ma is. 
Exemplos de Cmdlets Comuns : 
• Get-Process : Obtém informações sobre processos em execução.  
• Stop-Service : Interrompe um serviço.  
• Set-Item:  Define o valor de um item.  
• Get-EventLog:  Obtém entradas de um log de eventos.

## Bloco 14

```powershell
Alias  
Alias são nomes alternativos para cmdlets ou comandos. Eles permitem que você use 
versões abreviadas ou mais familiares de comandos, o que pode ser útil para quem vem de 
outros ambientes de linha de comando.  
Exemplos de Alias : 
• ls: Alias  para Get-ChildItem.  
• cd: Alias  para Set-Location.  
• cp: Alias  para Copy -Item.  
• rm: Alias  para Remove -Item.  
Você pode ver todos os alias disponíveis usando o comando:  
get-alias  
Funções  
Funções são blocos de código reutilizáveis que você pode definir dentro do PowerShell para 
executar tarefas específicas. Elas permitem encapsular lógica complexa em um comando 
simples que pode ser reutilizado.  
Exemplo de Definição de Função : 
function  Get-Greeting  { 
    param  ( 
```

## Bloco 15

```powershell
# Usar a função  
Get-Greeting  -Name  "Maria"  
```

## Bloco 16

```powershell
# Listar processos em execução  
Get-Process  
```

## Bloco 17

```powershell
Executando o Script : Para executar um script, abra o PowerShell e navegue até o diretório 
onde o script está salvo, então execute o script usando: .\greetings.ps1  
Configurações de Execução  
O PowerShell possui uma política de execução de scripts que determina quais scripts 
podem ser executados em um sistema. As políticas de execução mais comuns são:  
• Restricted: Nenhum script pode ser executado. Esta é a configuração padrão.  
• AllSigned: Somente scripts assinados digitalmente podem ser executados.  
• RemoteSigned : Scripts baixados da internet precisam ser assinados digitalmente, mas 
scripts locais podem ser executados sem assinatura.  
• Unrestricted : Todos os scripts podem ser executados, mas scripts baixados da internet 
exigem confirmação.  
Você pode verificar e alterar a política de execução usando os seguintes comandos:  
Verificar a Política de Execução : 
Get-ExecutionPolicy  
```

## Bloco 18

```powershell
Alterar a Política de Execução (por exemplo, para RemoteSigned) : 
Set-ExecutionPolicy  RemoteSigned  
```

## Bloco 19

```powershell
if (-not (Test-Path $BackupDir )) { 
    New-Item -ItemType  Directory  -Path $BackupDir  
} 
```

## Bloco 20

Exemplo 2: Script para Verificar o Uso de CPU de Processos  
$processos  = Get-Process  | Where -Object  { $_.CPU -gt 100 }

## Bloco 21

```powershell
3.1. Trabalhando com Arquivos e Diretórios  
O PowerShell oferece uma série de cmdlets  e funcionalidades para manipular arquivos e 
diretórios. Com esses comandos, você pode criar, copiar, mover, excluir, e listar arquivos e 
pastas de maneira eficiente.  
Navegação em Diretórios  
• Get-Location (alias: pwd) : Exibe o diretório atual em que você está navegando.  
Get-Location  
```

## Bloco 22

```powershell
• Set-Location (alias: cd) : Altera o diretório atual.  
Set-Location  -Path "C:\Users \SeuUsuario \Documentos"  
```

## Bloco 23

```powershell
Manipulação de Arquivos e Diretórios  
• Get-ChildItem (alias: ls, dir) : Lista arquivos e diretórios em um local específico.  
Get-ChildItem  -Path "C:\Users \andre \Documentos"  
```

## Bloco 24

```powershell
• New-Item: Cria novos arquivos ou diretórios.  
# Criar um diretório  
New-Item -Path "C:\Users \SeuUsuario \Documentos \NovaPasta"  -ItemType  Directory  
```

## Bloco 25

```powershell
# Criar um arquivo de texto  
New-Item -Path "C:\Users \SeuUsuario \Documentos \NovoArquivo.txt"  -ItemType  File 
```

## Bloco 26

```powershell
Leitura e Escrita de Arquivos  
• Get-Content (alias: gc) : Lê o conteúdo de um arquivo.  
Get-Content  -Path "C:\Users \SeuUsuario \Documentos \Arquivo.txt"  
```

## Bloco 27

```powershell
• Set-Content : Escreve ou substitui o conteúdo de um arquivo.  
Set-Content  -Path "C:\Users \SeuUsuario \Documentos \Arquivo.txt"  -Value  "Novo conteúdo"  
```

## Bloco 28

```powershell
Get-Process  | Out-File -FilePath  C:\Users \SeuUsuario \Documentos \Processos.txt"  
```

## Bloco 29

Funções Avançadas : Funções avançadas no PowerShell são semelhantes a cmdlets e podem 
utilizar recursos como parâmetros obrigatórios, validação de entrada e suporte a pipelines.  
function  Get-MaiorNumero  { 
    [CmdletBinding ()] 
    param  ( 
        [Parameter (Mandatory =$true )] 
        [int[]]$Numeros  
    )

## Bloco 30

# Usando a função avançada  
$maiorNumero  = Get-MaiorNumero  -Numeros  @(10, 20, 30) 
Write -Output  "O maior número é: $maiorNumero "

## Bloco 31

```powershell
New-LocalUser  -Name  "NovoUsuario"  -Password  (ConvertTo -SecureString  "SenhaSegura123"  
-AsPlainText  -Force ) -FullName  "Nome Completo"  -Description  "Descrição do Usuário"  
```

## Bloco 32

```powershell
Modificar Usuário : Para modificar as propriedades de um usuário, você pode usar o cmdlet Set -
LocalUser.  
Set-LocalUser  -Name  "NovoUsuario"  -FullName  "Nome Completo Atualizado"  -Description  
"Descrição Atualizada"  
```

## Bloco 33

```powershell
Gerenciamento de Grupos  
• Criar Novo Grupo : Use New -LocalGroup para criar grupos locais.  
New-LocalGroup  -Name  "NovoGrupo"  -Description  "Descrição do Grupo"  
```

## Bloco 34

```powershell
4.2. Gerenciamento de Processos e Serviços  
Gerenciamento de Processos  
• Listar Processos : Use Get -Process para listar todos os processos em execução.  
Get-Process  
```

## Bloco 35

```powershell
Gerenciamento de Serviços  
• Listar Serviços : Para listar todos os serviços no sistema, use Get -Service.  
Get-Service  
```

## Bloco 36

```powershell
Alterar o Tipo de Inicialização de um Serviço : Para alterar o tipo de inicialização de um serviço 
(Manual, Automático, Desativado), use o cmdlet Set -Service.  
Set-Service  -Name  "NomeDoServico"  -StartupType  Automatic  
```

## Bloco 37

```powershell
4.3. Gerenciamento de Discos e Sistema de Arquivos  
Gerenciamento de Discos  
• Listar Informações sobre Discos : Use o cmdlet Get -PhysicalDisk para obter 
informações sobre os discos físicos.  
Get-PhysicalDisk  
```

## Bloco 38

```powershell
• Gerenciamento de Volumes e Partições : Use Get -Volume para listar todos os volumes 
e Get -Partition  para listar as partições.  
Get-Volume  
Get-Partition  
```

## Bloco 39

```powershell
 19 Gerenciamento de Sistema de Arquivos  
• Gerenciamento de Permissões (ACLs) : As listas de controle de acesso (ACLs) podem 
ser gerenciadas com os cmdlets Get -Acl, Set -Acl, e New -Object (para criar regras).  
o Exibir ACLs : (Ampliar este conteúdo com os detalhes do comando)  
Get-Acl -Path "C:\windows"  
```

## Bloco 40

```powershell
• Modificar ACLs : 
$acl = Get-Acl -Path "C:\PastaExemplo"  
$rule  = New-Object  System.Security.AccessControl.FileSystemAccessRule ("Usuario" , 
"FullControl" , "Allow" ) 
$acl.SetAccessRule( $rule ) 
Set-Acl -Path "C:\PastaExemplo"  -AclObject  $acl 
```

## Bloco 41

```powershell
4.4. Gerenciamento de Rede  
Configuração de Rede  
• Obter Informações de Rede : Use Get -NetIPAddress para obter informações sobre os 
endereços IP configurados no sistema.  
Get-NetIPAddress  
```

## Bloco 42

```powershell
• Configurar Endereço IP Estático : Use New -NetIPAddress para configurar um endereço 
IP estático.  
New-NetIPAddress  -InterfaceAlias  "Ethernet"  -IPAddress  "192.168.1.100"  -PrefixLength  24 -
DefaultGateway  "192.168.1.1"  
```

## Bloco 43

```powershell
• Configurar DNS : Para configurar servidores DNS, use Set -DnsClientServerAddress.  
Set-DnsClientServerAddress  -InterfaceAlias  "Ethernet"  -ServerAddresses  ("8.8.8.8" , "8.8.4.4" ) 
```

## Bloco 44

```powershell
• Monitoramento de Conexões de Rede : Use Get -NetTCPConnection para monitorar as 
conexões TCP ativas.  
Get-NetTCPConnection  
```

## Bloco 45

```powershell
Get-GPResultantSetOfPolicy  -Computer  "NomeDoComputador"  -ReportType  Html -Path 
"C:\Relatorios \GPO -Relatorio.html"  
```

## Bloco 46

```powershell
Gerenciamento de Políticas de Segurança  
• Configuração de Políticas de Segurança : Use Set -ExecutionPolicy para configurar a 
política de execução de scripts no PowerShell.  
Set-ExecutionPolicy  RemoteSigned  
```

## Bloco 47

```powershell
• Monitoramento de Eventos de Segurança : Use Get -EventLog para monitorar logs de 
eventos de segurança.  
Get-EventLog  -LogName  Security  -Newest  50 #Deve ser executado no terminal do PowerShell 
como Administrador!  
```

## Bloco 48

4.6. Automação de Tarefas e Agendamento  
Agendamento de Tarefas  
• Criar uma Tarefa Agendada : Use New -ScheduledTask e Register -ScheduledTask  para 
criar e registrar uma tarefa agendada.  
$action  = New-ScheduledTaskAction  -Execute  "PowerShell.exe"  -Argument  "-File 
C:\Scripts \Backup.ps1"  
$trigger  = New-ScheduledTaskTrigger  -Daily  -At "03:00AM"  
Register -ScheduledTask  -Action  $action  -Trigger  $trigger  -TaskName  "BackupDiario"  -
Description  "Backup diário do sistema"

## Bloco 49

Gerenciar Tarefas Agendadas : Use Get-ScheduledTask , Set-ScheduledTask  e Unregister -
ScheduledTask  para gerenciar tarefas existentes.

## Bloco 50

```powershell
Get-ScheduledTask  -TaskName  "BackupDiario"  
```

## Bloco 51

Automação com Scripts  
• Automatizar Backups : Crie scripts que automatizem o backup de dados importantes, 
executando -os regularmente através de tarefas agendadas.  
# Script de backup  
Copy -Item -Path "C:\DadosImportantes"  -Destination  "D:\Backups \$(Get-Date  -Format  
yyyyMMdd )" -Recurse

## Bloco 52

• Monitoramento Automático : Configure scripts que monitorem serviços críticos e 
enviem alertas em caso de falha.  
# Script de monitoramento  
if (-not (Get-Service  -Name  "NomeDoServico"  -ErrorAction  SilentlyContinue ).Status -eq 
'Running' ) { 
    Send -MailMessage  -To "admin@example.com"  -From  "monitor@example.com"  -Subject  
"Serviço Parado"  -Body  "O serviço NomeDoServico parou."  -SmtpServer  "smtp.example.com"  
}

## Bloco 53

```powershell
 21 Neste tópico, exploraremos como trabalhar com processos em execução, como utilizar o 
comando Tasklist, e como finalizar processos específicos.  
5.1 Processos em Execução  
Um processo em execução é um programa ou aplicação que está atualmente sendo executado 
no sistema. Cada processo é identificado por um identificador único (PID - Process Identifier) e 
possui várias propriedades associadas, como nome, uso de memória, tempo de CPU, entre 
outras.  
Listar Processos em Execução  
• Get-Process : O cmdlet Get -Process é usado para listar todos os processos que estão 
atualmente em execução no sistema. Ele exibe informações detalhadas sobre cada 
processo, incluindo o nome, PID, uso de CPU, memória, entre outros.  
Exemplo : 
Get-Process  
```

## Bloco 54

```powershell
Filtrar Processos Específicos : Você pode filtrar a lista de processos para exibir apenas aqueles 
que correspondem a um nome específico.  
Get-Process  -Name  "notepad"  
```

## Bloco 55

```powershell
Filtrar por PID : Para obter informações sobre um processo específico usando seu PID, use o 
parâmetro -Id. 
Get-Process  -Id 1234  
```

## Bloco 56

```powershell
Exibir Processos em Ordem de Uso de CPU : Para listar os processos em ordem de uso de 
CPU, use Sort -Object.  
Get-Process  | Sort-Object  -Property  CPU  -Descending  
```

## Bloco 57

```powershell
Monitoramento de Processos em Tempo Real  
• Atualização Contínua de Processos : Para monitorar os processos em tempo real, você 
pode utilizar um loop que atualiza constantemente a lista de processos.  
while  ($true ) { 
    Get-Process  
    Start -Sleep  -Seconds  5 
    Clear -Host 
} 
```

## Bloco 58

6. Scripts e Automação com PowerShell  
O PowerShell é amplamente reconhecido por suas poderosas capacidades de scripting  e 
automação. A criação de scripts no PowerShell permite que tarefas repetitivas sejam 
automatizadas, resultando em maior eficiência e precisão na administração de sistemas. Nesta 
seção, vamos explorar os fundamentos da criação de scripts, técnicas avançad as de automação, 
e como aplicar práticas recomendadas para desenvolver scripts robustos e eficientes.  
6.1 Script Básico para Backup Diário  
# Define os caminhos de origem e destino  
$source  = "C:\Caminho \Para \DiretorioOrigem"  
$destination  = "D:\Caminho \Para \DiretorioDestino \backup_"  + (Get-Date  -Format  "dd-MM-yyyy" ) 
# Copia os arquivos do diretório de origem para o diretório de destino  
Copy -Item -Path $source \* -Destination  $destination  -Recurse  -Force  
# Cria uma entrada no log com a data e hora atuais  
$logMessage  = "Backup concluído em "  + (Get-Date  -Format  "dd/MM/yyyy HH:mm:ss" ) 
$logPath  = "D:\Caminho \Para \DiretorioDestino \backup_log.txt"  
Add-Content  -Path $logPath  -Value  $logMessage

## Bloco 59

```powershell
 24 • $destination : Esta variável armazena o caminho do diretório de destino, onde os arquivos 
copiados serão armazenados. A variável Get-Date  -Format  "dd-MM-yyyy"  é usada para 
adicionar a data atual ao nome do diretório de destino, criando uma pasta de backup 
com a data atual.  
Formato de Data : A data é formatada como "dd-MM-yyyy" , o que resultará em algo como 
"backup_22 -07-2024", dependendo da data em que o script é executado.  
2. Copiando os Arquivos do Diretório de Origem para o Diretório de Destino  
• Copy -Item: Este é o comando PowerShell usado para copiar arquivos e diretórios.  
• -Path  $source \*: Especifica o caminho de origem com um curinga ( *), o que significa 
que todos os arquivos e subdiretórios do diretório de origem serão copiados.  
• -Destination  $destination : Especifica o caminho de destino onde os arquivos serão 
copiados.  
• -Recurse : Esta opção permite que o comando copie recursivamente todos os 
subdiretórios e seus conteúdos.  
• -Force : Esta opção força a cópia dos arquivos, substituindo arquivos no destino sem 
solicitar confirmação.  
Resultado : Todos os arquivos e subdiretórios do diretório de origem serão copiados para o 
diretório de destino, que inclui a data no nome.  
3. Registrando a Conclusão do Backup em um Arquivo de Log  
• $logMessage : Esta variável armazena uma mensagem de log, que inclui a informação 
"Backup concluído em " seguida pela data e hora atual, formatada como "dd/MM/yyyy 
HH:mm" . 
• $logPath : Esta variável armazena o caminho e nome do arquivo de log onde a 
mensagem será gravada.  
• Add-Content : Este comando adiciona o conteúdo especificado (neste caso, a mensagem 
de log) ao final de um arquivo. Se o arquivo não existir, ele será criado.  
Resultado: Após a conclusão da cópia dos arquivos, o script registra no arquivo de log a data 
e hora em que o backup foi concluído.  
Funcionamento Geral do Script  
• Propósito: O script é projetado para criar uma cópia de segurança dos arquivos de um 
diretório de origem para um diretório de destino, onde o diretório de destino inclui a data 
do backup no seu nome. Além disso, o script registra no log a data e hora em qu e o 
backup foi concluído.  
• Automação: Este script pode ser agendado para ser executado automaticamente em 
intervalos regulares (por exemplo, diariamente) para garantir que backups regulares 
sejam feitos sem intervenção manual.  
• Flexibilidade: Como o destino do backup é nomeado com a data, cada execução do 
script cria um novo diretório de backup, evitando sobrescrever backups anteriores e 
mantendo um histórico das cópias de segurança.  
6.2 Script para Limpeza de Arquivos Temporários  
# Define o diretório temporário do sistema  
$temp_dir  = $env:TEMP  
# Exclui todos os arquivos no diretório temporário  
Get-ChildItem  -Path $temp_dir  -Recurse  -Force  | Remove -Item -Force  
# Remove o próprio diretório temporário (e seu conteúdo se ainda houver algum)  
Remove -Item -Path $temp_dir  -Recurse  -Force  
# Registra a limpeza no log com a data e hora atuais  
```

## Bloco 60

25 $logMessage  = "Diretório de arquivos temporários limpo em "  + (Get-Date  -Format  
"dd/MM/yyyy HH:mm:ss" ) 
$logPath  = "C:\Logs \temp_cleanup_log.txt"  
Add-Content  -Path $logPath  -Value  $logMessage

## Bloco 61

```powershell
• $env:TEMP : Obtém o caminho do diretório temporário do sistema, que é armazenado na 
variável de ambiente TEMP.  
2. Excluindo Todos os Arquivos no Diretório Temporário : 
  Get-ChildItem  -Path $temp_dir  -Recurse -Force : Lista todos os arquivos e subdiretórios 
no diretório temporário recursivamente, incluindo arquivos ocultos e de sistema.  
• Remove -Item -Force : Exclui os arquivos e diretórios listados sem solicitar confirmação.  
3. Removendo o Diretório Temporário : 
• Remove -Item -Path $temp_dir  -Recurse -Force : Remove o diretório temporário e 
qualquer conteúdo restante que não tenha sido excluído na etapa anterior.  
4. Registrando a Limpeza no Log : 
• $logMessage : Cria uma mensagem de log contendo a informação de que a limpeza foi 
concluída, juntamente com a data e hora atuais.  
• Add-Content  -Path $logPath  -Value  $logMessage : Adiciona a mensagem de log ao 
arquivo temp_cleanup_log.txt  no diretório C:\Logs . Se o arquivo não existir, ele será 
criado.  
Funcionamento Geral do Script  
• Objetivo : Este script limpa o diretório temporário do sistema excluindo todos os arquivos 
e pastas dentro dele e, em seguida, registra a operação em um arquivo de log.  
• Automatização : O script pode ser executado manualmente ou agendado para execução 
periódica para manter o diretório temporário limpo, o que pode ajudar a liberar espaço 
em disco e melhorar o desempenho do sistema.  
• Registro de Atividade : Mantém um log das operações de limpeza, incluindo a data e 
hora em que foram realizadas, o que é útil para monitorar e auditar a manutenção do 
sistema.  
6.3 Script para Monitoramento de Logs do Event Viewer  
```

## Bloco 62

# Define o caminho do arquivo de log  
$logfile  = "C:\Logs \event_log.txt"  
# Extrai os últimos 10 eventos do log de Aplicações e salva no arquivo de log  
wevtutil  qe Application  /rd:true  /f:text  /c:10  > $logfile  
# Adiciona uma linha no arquivo de log com a data e hora da monitorização  
$logMessage  = "Logs monitorados em "  + (Get-Date  -Format  "dd/MM/yyyy HH:mm:ss" ) 
Add-Content  -Path $logfile  -Value  $logMessage

## Bloco 63

```powershell
 26 • $logMessage  = "Logs monitorados em "  + (Get-Date -Format "dd/MM/yyyy HH:mm ”): 
Cria uma mensagem de log contendo a data e hora atuais.  
• Add-Content  -Path $logfile  -Value  $logMessage : Adiciona a mensagem de log ao final 
do arquivo, registrando quando os eventos foram monitorados.  
6.4 Backup de Documentos Pessoais  
# Define o caminho da origem  
$source  = "C:\Users \[pasta_do_usuario] \Documentos"  
# Cria a pasta de destino com a data formatada  
$destination  = "D:\Backup \Documentos \backup_"  + (Get-Date  -Format  "dd-MM-yyyy" ) 
# Verifica se a pasta de destino existe, se não, cria a pasta  
if (-not (Test-Path -Path $destination )) { 
    New-Item -ItemType  Directory  -Path $destination  
} 
# Copia os arquivos da origem para o destino, incluindo subpastas e arquivos ocultos  
Copy -Item -Path $source \* -Destination  $destination  -Recurse  -Force  
# Registra a data e a hora no log  
$logEntry  = "Backup de Documentos concluído em "  + (Get-Date  -Format  "dd/MM/yyyy 
HH:mm:ss" ) + "`r`n"  
Add-Content  -Path "D:\Backup \Documentos \backup_log.txt"  -Value  $logEntry  
```

## Bloco 64

```powershell
Explicação dos comandos.  
• Formatação de data : A formatação da data no PowerShell é feita usando Get -Date -
Format "formato".  
• Test-Path e New -Item: Esses comandos verificam se o diretório de destino já existe e, 
se não, criam o diretório.  
• Copy -Item: É o comando usado para copiar arquivos e diretórios no PowerShell. A 
opção -Recurse garante que todas as subpastas e arquivos sejam copiados, e a opção 
-Force permite substituir arquivos existentes.  
• Add-Content : Este comando adiciona a entrada de log ao arquivo especificado, 
criando -o se não existir.  
6.5 Backup de Projetos de Desenvolvimento  
# Define o caminho da origem  
$source  = "C:\Desenvolvimento \Projetos"  
# Cria a pasta de destino com a data formatada  
$destination  = "\\Servidor \Backups \Projetos \backup_"  + (Get-Date  -Format  "dd-MM-yyyy" ) 
# Verifica se a pasta de destino existe, se não, cria a pasta  
if (-not (Test-Path -Path $destination )) { 
    New-Item -ItemType  Directory  -Path $destination  
} 
# Copia os arquivos da origem para o destino, incluindo subpastas e arquivos ocultos  
Copy -Item -Path $source \* -Destination  $destination  -Recurse  -Force  
# Registra a data e a hora no log 
$logEntry  = "Backup de Projetos concluído em "  + (Get-Date  -Format  "dd/MM/yyyy 
HH:mm:ss" ) + "`r`n"  
Add-Content  -Path "\\Servidor \Backups \Projetos \backup_log.txt"  -Value  $logEntry  
Explicação dos comandos  
• Variáveis : $source e $destination  armazenam os caminhos de origem e destino.  
• Formatação da data : Usamos Get -Date -Format "dd -MM-yyyy" para formatar a data 
na criação da pasta de backup.  
• Test-Path e New -Item: Verifica se o diretório de destino existe e cria -o se necessário.  
• Copy -Item: Este comando copia todos os arquivos e subpastas do diretório de origem 
para o diretório de destino, incluindo arquivos ocultos.  
• Add-Content : Adiciona uma linha ao arquivo de log com a data e hora da conclusão do 
backup.  
```

## Bloco 65

```powershell
 27  
Automatizar a Limpeza de Arquivos Temporários  
Exemplo 1: Manutenção de Sistema em um PC Pessoal  
#Limpar o diretório Temp da pasta do usuário atual  
# Define o diretório temporário  
$temp_dir  = $env:TEMP  
# Exclui todos os arquivos no diretório temporário  
Get-ChildItem  -Path $temp_dir \* -Recurse  | Remove -Item -Force  
# Remove o diretório temporário e todas as subpastas  
Remove -Item -Path $temp_dir  -Recurse  -Force  
# Registra a data e a hora no log  
$logEntry  = "Diretório de arquivos temporários limpo em "  + (Get-Date  -Format  
"dd/MM/yyyy HH:mm:ss" ) + "`r`n"  
Add-Content  -Path "C:\Logs \temp_cleanup_log.txt"  -Value  $logEntry  
Explicação do código.  
• Variável $temp_dir : O PowerShell usa $env:TEMP para acessar a variável de 
ambiente TEMP.  
• Remoção de arquivos : Get -ChildItem -Path $temp_dir \* -Recurse | Remove -Item -
Force lista e remove todos os arquivos no diretório temporário, incluindo os arquivos 
em subpastas.  
• Remoção de diretório : Remove -Item -Path $temp_dir  -Recurse -Force remove o 
diretório temporário e todas as subpastas.  
• Log: Add -Content adiciona uma linha ao arquivo de log com a data e hora da limpeza . 
```

## Bloco 66

```powershell
Exemplo 2: Manutenção de Servidor de Arquivos  
#Semelhante ao anterior  porém para ser executado em rede, para servidores  
#Define o diretório temporário  
$temp_dir  = $env:TEMP  
# Exclui todos os arquivos no diretório temporário  
Get-ChildItem  -Path $temp_dir \* -Recurse  | Remove -Item -Force  
# Remove o conteúdo do diretório temporário  
Get-ChildItem  -Path $temp_dir \* -Recurse  | Remove -Item -Recurse  -Force  
# Registra a data e a hora no log  
$logEntry  = "Diretório de arquivos temporários limpo em "  + (Get-Date  -Format  
"dd/MM/yyyy HH:mm:ss" ) + "`r`n"  
Add-Content  -Path "\\Servidor \Logs \temp_cleanup_log.txt"  -Value  $logEntry  
```

## Bloco 67

```powershell
• Definição do diretório temporário : 
A variável $temp_dir é usada para armazenar o caminho para o diretório temporário 
($env:TEMP).  
• Remoção de arquivos : 
Get-ChildItem -Path $ temp_dir \* -Recurse | Remove -Item -Force lista todos os arquivos e 
subpastas no diretório temporário e os remove. A opção -Recurse garante que todos os 
arquivos em subpastas também sejam removidos.  
• Remoção de subpastas : 
A remoção é feita de forma recursiva com Remove -Item -Recurse -Force, que remove os 
arquivos e pastas dentro do diretório temporário, mas não tenta remover o próprio diretório, 
pois ele é um diretório do sistema que será recriado automaticamente.  
• Registro em log : 
O script adiciona uma entrada ao arquivo de log \\Servidor \Logs \temp_cleanup_log.txt, 
registrando a data e hora da limpeza.  
```

## Bloco 68

28 Monitoramento e Registro do Uso de CPU e Memória  
• Exemplo 1: Monitoramento de Desempenho de um Servidor ou Desktop  
# Define o caminho do arquivo de log  
$logfile  = "C:\Logs \server_usage_log.txt"  
# Função p ara formatar bytes em KB, MB, GB  
function  Format -Size ($size ) { 
    if ($size  -ge 1GB) { 
        return  "{0:N2} GB"  -f ($size  / 1GB) 
    } 
    elseif  ($size  -ge 1MB) { 
        return  "{0:N2} MB"  -f ($size / 1MB) 
    } 
    elseif  ($size  -ge 1KB) { 
        return  "{0:N2} KB"  -f ($size  / 1KB) 
    } 
    else { 
        return  "$size  Bytes"  
    } 
} 
# Função para formatar o tempo de CPU em horas, minutos e segundos  
function  Format -CPUTime  ($cpuTime ) { 
    $timespan  = [TimeSpan ]::FromSeconds( $cpuTime ) 
    return  $timespan .ToString( "hh\:mm\:ss") 
} 
# Loop infinito  
while  ($true ) { 
    # Adiciona a data e a hora ao log e exibe na tela  
    $timestamp  = Get-Date  -Format  "dd/MM/yyyy HH:mm:ss"  
    Write -Host $timestamp  
    $timestamp  | Out-File -FilePath  $logfile  -Append

## Bloco 69

# Obtém os 10 processos que mais consomem CPU e formata WS, PM e CPU  
    $processInfo  = Get-Process  | Sort-Object  CPU  -Descending  | Select -Object  -First 10 | 
ForEach -Object  { 
        [PSCustomObject ]@{ 
            Name = $_.Name  
            CPU = Format -CPUTime  $_.CPU  
            WS = Format -Size $_.WorkingSet  
            PM = Format -Size $_.PagedMemorySize  
        } 
    } | Format -Table  -AutoSize  | Out-String  -Width  512 
        # Exibe na tela e registra no log  
    Write -Host $processInfo  
    $processInfo  | Out-File -FilePath  $logfile  -Append  
        # Adiciona uma linha em branco ao log e exibe na tela  
    "`r`n"  | Out-File -FilePath  $logfile  -Append  
    Write -Host "" 
        # Aguarda 300 segundos (5 minutos)  
    Start -Sleep  -Seconds  300

## Bloco 70

Sincronização de Diretórios com Robocopy  
• Exemplo 1: Sincronização de Diretórios Entre Computadores  
# Define os caminhos de origem e destino  
$source  = "C:\Trabalho"  
$destination  = "\\OfficePC \Trabalho" # Deve definir para qual destino será sincronizado o 
conteúdo da pasta trabalho  
# Define o caminho do arquivo de log  
$logfile  = "C:\Logs \robocopy_log.txt"  
# Executa o comando Robocopy com os parâmetros especificados  
Start -Process  -FilePath  "robocopy.exe"  -ArgumentList  "$source ", "$destination ", "/MIR" , 
"/R:5" , "/W:10" , "/LOG: $logfile " -NoNewWindow  -Wait

## Bloco 71

# Executa o comando Robocopy com os parâmetros especificados  
Start -Process  -FilePath  "robocopy.exe"  -ArgumentList  "$source ", "$destination ", "/MIR" , 
"/R:5" , "/W:10" , "/LOG: $logfile " -NoNewWindow  -Wait  
Explicação do script  
• o destino ($destination) é ajustado para um disco local, D: \Backup \Projetos, em vez de 
um caminho de rede.  
• Outras partes do script : 
• As variáveis $source e $logfile  continuam definindo os caminhos de origem e de log, 
respectivamente.  
• O comando Start -Process chama robocopy.exe com os mesmos parâmetros:  
o /MIR: Mantém o espelho da origem no destino.  
o /R:5: Tenta repetir a cópia até 5 vezes em caso de falha.  
o /W:10: Aguarda 10 segundos entre tentativas.  
o /LOG:$logfile: Registra a saída em um arquivo de log.  
• -NoNewWindow e -Wait garantem que o processo seja executado na mesma janela e o 
script espere pela conclusão.

## Bloco 72

Criação de Ponto de Restauração do Sistema  
• Exemplo 1: Criação Automática de Pontos de Restauração Antes de Instalar 
Atualizações  
# Cria um ponto de restauração do sistema com a descrição especificada  
Checkpoint -Computer  -Description  'Antes da Atualização'  -RestorePointType  
'MODIFY_SETTINGS'  
# Registra a criação do ponto de restauração no arquivo de log  
$timestamp  = Get-Date  -Format  "dd/MM/yyyy HH:mm:ss"  
$logMessage  = "Ponto de restauração criado antes da atualização em $timestamp " 
$logMessage  | Out-File -FilePath  "C:\Logs \restore_point_log.txt"  -Append

## Bloco 73

30  
Script para Backup Compactador de Fotos  
# Define os caminhos de origem e destino  
$source  = "C:\Fotos"  
$destination  = "D:\Backup \Fotos \backup_"  + (Get-Date  -Format  "dd-MM-yyyy" ) + ".zip"  
# Compacta os arquivos do diretório de origem para o arquivo zip de destino  
Compress -Archive  -Path "$source \*" -DestinationPath  $destination  
# Registra a operação no arquivo de log com a data e hora atuais  
$logMessage  = "Fotos compactadas em "  + (Get-Date  -Format  "dd/MM/yyyy HH:mm:ss" ) 
$logPath  = "D:\Backup \Fotos \backup_log.txt"  
Add-Content  -Path $logPath  -Value  $logMessage

## Bloco 74

# Executa o comando CHKDSK no drive C: e registra a saída no log  
Start -Process  -FilePath  "chkdsk.exe"  -ArgumentList  "C: /F /R"  -NoNewWindow  -
RedirectStandardOutput  "C:\Logs \chkdsk_log.txt"

## Bloco 75

```powershell
 31 Exportação de Políticas de Segurança para Backup  
Este script deve ser salvo em um arquivo com extensão ps1 e executado como administrador 
do sistema.  
# Define o caminho do diretório de backup e do arquivo de configuração  
$backupDir  = "C:\Backup"  
$cfgFile  = "$backupDir \secpol.cfg"  
# Verifica se o diretório de backup existe; se não existir, cria o diretório  
if (-Not (Test-Path -Path $backupDir )) { 
    try { 
        New-Item -Path $backupDir  -ItemType  Directory  -ErrorAction  Stop | Out-Null 
        Write -Host "Diretório de backup criado: $backupDir " 
    } catch  { 
        Write -Host "Erro ao criar o diretório de backup: $_" -ForegroundColor  Red 
        Exit 
    } 
} 
# Exporta as configurações de segurança para o arquivo .cfg  
try { 
    Start -Process  -FilePath  "secedit.exe"  -ArgumentList  "/export /cfg $cfgFile " -NoNewWindow  -
Wait -ErrorAction  Stop 
    if (Test-Path -Path $cfgFile ) { 
        Write -Host "Configurações de segurança exportadas com sucesso para: $cfgFile " 
    } else { 
        Write -Host "Falha na exportação das configurações de segurança. O arquivo não foi 
criado."  -ForegroundColor  Red 
        Exit 
    } 
} catch  { 
    Write -Host "Erro ao exportar as configurações de segurança: $_" -ForegroundColor  Red 
    Exit 
} 
# Registra a exportação das configurações de segurança no log com a data e hora atuais  
$logMessage  = "Configurações de segurança exportadas em "  + (Get-Date  -Format  
"dd/MM/yyyy HH:mm:ss" ) 
$logPath  = "C:\Logs \secpol_export_log.txt"  
Add-Content  -Path $logPath  -Value  $logMessage  
Write -Host "Operação registrada no log: $logPath "  
```

## Bloco 76

```powershell
Backup do registro do Windows  
# Define o caminho para o backup do registro e o log  
$regBackupFile  = "C:\Backup \registro_backup.reg"  
$logFile  = "C:\Logs \registry_backup_log.txt"  
# Verifica e cria o diretório de backup se necessário  
if (-Not (Test-Path -Path "C:\Backup" )) { 
    New-Item -Path "C:\Backup"  -ItemType  Directory  | Out-Null 
} 
# Faz o backup de todo o registro  
reg export  HKLM  $regBackupFile  /y 
# Registra a operação no log  
$logMessage  = "Backup geral do registro realizado em "  + (Get-Date  -Format  "dd/MM/yyyy 
HH:mm:ss" ) 
Add-Content  -Path $logFile  -Value  $logMessage  
```

## Bloco 77

# Registra a operação no log  
        $logMessage  = "Restauração do registro realizada em "  + (Get-Date  -Format  "dd/MM/yyyy 
HH:mm:ss" ) 
        Add-Content  -Path $logFile  -Value  $logMessage  
        Write -Host "Restauração do registro concluída com sucesso."  
    } catch  { 
        Write -Host "Erro ao restaurar o registro: $_" -ForegroundColor  Red 
    } 
} else { 
    Write -Host "Arquivo de backup do registro não encontrado: $regBackupFile " -
ForegroundColor  Red 
}

