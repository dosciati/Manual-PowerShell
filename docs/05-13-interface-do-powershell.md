# 1.3. Interface do PowerShell

**PowerShell Console vs. PowerShell ISE vs. Visual Studio Code**

**PowerShell Console**

- Interface padrão de linha de comando.

- Utilizada principalmente para execução rápida de comandos e scripts.

**PowerShell ISE (Integrated Scripting Environment)**

- Ambiente de desenvolvimento integrado específico para PowerShell.

- Oferece recursos como destaque de sintaxe, depuração e execução de
  scripts.

- Ideal para escrever e testar scripts PowerShell.

**Visual Studio Code**

- Editor de código leve e extensível, suportando múltiplas linguagens.

- Possui extensão PowerShell para suporte completo à linguagem.

- Recomendado para desenvolvimento avançado de scripts e módulos
  PowerShell devido a suas capacidades de integração e personalização.

**Navegação Básica na Interface**

**PowerShell Console e ISE**

- **Executar Comandos**: Digite um comando e pressione Enter.

- **Histórico de Comandos**: Use as setas para cima e para baixo para
  navegar pelos comandos anteriores.

- **Autocompletar**: Use a tecla Tab para autocompletar comandos e
  parâmetros.

**Visual Studio Code**

- **Abrir Terminal**: Ctrl + \' para abrir o terminal integrado.

- **Executar Scripts**: Abra o arquivo .ps1 e pressione F5 para
  executar.

- **Extensão PowerShell**: Instale a extensão PowerShell para suporte
  avançado, como autocompletar, depuração e formatação de código.

##### 2.1. Cmdlets e Sintaxe Básica

**Estrutura dos Cmdlets (Verbo-Substantivo)**

Os cmdlets (pronunciado \"command-lets\") são os comandos utilizados no
PowerShell. Eles seguem uma convenção de nomenclatura consistente que
facilita a leitura e a compreensão dos scripts. Cada cmdlet é
estruturado no formato \"Verbo-Substantivo\".

**Verbo-Substantivo**

**Verbo**: Representa a ação a ser realizada. Alguns verbos comuns
incluem 🡺 Get, Set, New, Remove, Start, Stop.

**Substantivo**: Indica o objeto no qual a ação será realizada. Exemplo:
🡺Process, Service, Item, content.

**Exemplos de Cmdlets**:

- Get-Process: Obtém informações sobre processos em execução.

- Set-Item: Define o valor de um item.

- New-Item: Cria um novo item, como um arquivo ou pasta.

- Remove-Service: Remove um serviço.

**Execução de Cmdlets Básicos**

**Get-Help** O cmdlet Get-Help é utilizado para obter informações
detalhadas sobre outros cmdlets e suas sintaxes. É uma ferramenta
essencial para aprender a usar cmdlets e entender suas opções.

**Exemplo**:

Get-Help Get-Process

**Parâmetros Úteis**:

- -Detailed: Fornece uma descrição detalhada do cmdlet.

- -Examples: Exibe exemplos de como usar o cmdlet.

- -Full: Exibe toda a documentação disponível para o cmdlet.

Get-Help Get-Process -Examples

**Get-Command** O cmdlet Get-Command lista todos os cmdlets, funções,
aliases e scripts disponíveis na sessão atual do PowerShell. É útil para
descobrir comandos que podem ser usados.

- **Exemplo**:

Get-Command

- **Filtrar por Verbo**:

Get-Command -Verb Get

- **Filtrar por Substantivo**:

Get-Command -Noun Process

**Get-Member** O cmdlet Get-Member exibe as propriedades e métodos dos
objetos. É usado para explorar e entender os tipos de objetos que os
cmdlets retornam.

- **Exemplo**:

Get-Process \| Get-Member

- **Descrição**:

  - Get-Process obtém uma lista de processos em execução.

  - \| (pipe) passa a saída de Get-Process como entrada para Get-Member.

  - Get-Member exibe as propriedades (como **Id, Name, CPU**) e métodos
    (como **Kill, Start**) dos objetos de processo.

> **Exemplos Práticos**
>
> **Exemplo 1: Listar todos os processos em execução**
>
> ![](media/image1.png){width="4.888199912510936in"
> height="1.3749496937882764in"}
>
> **Exemplo 2: Obter ajuda sobre o cmdlet Get-Process**
>
> ![](media/image2.png){width="4.983238188976378in"
> height="1.9825174978127733in"}
>
> **Exemplo 3: Listar todos os cmdlets que começam com \"Get\"**
>
> ![](media/image3.png){width="4.8775284339457565in"
> height="1.3404024496937883in"}
>
> **Exemplo 4: Exibir as propriedades e métodos dos objetos retornados
> pelo cmdlet Get-Service**
>
> ![](media/image4.png){width="5.905555555555556in"
> height="1.6756944444444444in"}

##### 2.2. Objetos e Pipeline

> **Modelo Baseado em Objetos**
>
> Diferentemente de outras ferramentas de linha de comando que retornam
> texto simples, o PowerShell utiliza um modelo baseado em objetos. Isso
> significa que os cmdlets do PowerShell retornam objetos .NET,
> proporcionando uma maneira rica e estruturada de manipular dados.
>
> **Objetos .NET**

- **Propriedades**: Atributos que descrevem as características de um
  objeto. Por exemplo, um objeto Process pode ter propriedades como Id,
  Name e CPU.

- **Métodos**: Ações que podem ser realizadas em um objeto. Por exemplo,
  um objeto Process pode ter métodos como Kill() e Start().

> **Exemplo de Retorno de Objeto**

O cmdlet Get-Process retorna objetos Process que têm várias propriedades
e métodos associados.

\$process = Get-Process -Name \"notepad\"

> Para acessar as propriedades do objeto retornado:

\$process.Id

\$process.Name

\$process.CPU

> **Pipeline**
>
> O pipeline é um dos conceitos mais poderosos do PowerShell. Ele
> permite encadear cmdlets de maneira que a saída de um cmdlet seja
> passada como entrada para o próximo cmdlet. Isso facilita o
> processamento e manipulação de dados de maneira sequencial.
>
> **Operador de Pipeline (\|)**

- O operador de pipeline (\|) é usado para conectar cmdlets.

- A saída de um cmdlet é passada como entrada para o cmdlet seguinte no
  pipeline.

> **Exemplo Simples de Pipeline**

- Listar os processos em execução e selecionar apenas os processos que
  estão consumindo mais de 100MB de memória.

Get-Process \| Where-Object { \$\_.WorkingSet -gt 100MB }

- Get-Process: Obtém a lista de processos em execução.

- \|: Passa a saída do Get-Process para o próximo cmdlet.

- Where-Object { \$\_.WorkingSet -gt 100MB }: Filtra os processos com
  uso de memória superior a 100MB. O \$\_ representa o objeto atual no
  pipeline.

> **Exemplo de Pipeline com Vários Cmdlets**

- Obter os nomes de todos os serviços em execução e ordená-los
  alfabeticamente.

Get-Service \| Where-Object { \$\_.Status -eq \'Running\' } \|
Sort-Object -Property Name \| Select-Object -Property Name

- Get-Service: Obtém a lista de serviços.

- Where-Object { \$\_.Status -eq \'Running\' }: Filtra os serviços que
  estão em execução.

- Sort-Object -Property Name: Ordena os serviços pelo nome.

- Select-Object -Property Name: Seleciona apenas a propriedade Name dos
  serviços.

> **Trabalhando com Propriedades e Métodos**

- Para exibir as propriedades de um objeto no pipeline, use o cmdlet
  Select-Object.

Get-Process \| Select-Object -Property Name, Id, CPU

> Para invocar métodos em objetos no pipeline, use o cmdlet
> ForEach-Object.

Get-Process \| ForEach-Object {

\[PSCustomObject\]@{

ProcessName = \$\_.Name

PID = \$\_.Id

MemoryUsageMB = \[math\]::Round(\$\_.WorkingSet64 / 1MB, 2)

}

} \| Format-Table -AutoSize

> **Exemplos Práticos**
>
> **Exemplo 1: Obter detalhes de processos específicos**

Get-Process -Name \"explorer\" \| Select-Object -Property Name, Id, CPU,
StartTime

> **Exemplo 2: Listar serviços e exibir apenas o nome e status**

Get-Service \| Select-Object -Property Name, Status

> **Exemplo 3: Filtrar arquivos em um diretório por tamanho e ordenar
> por nome**

Get-ChildItem -Path \"C:\\Logs\" \| Where-Object { \$\_.Length -gt 1MB }
\| Sort-Object -Property Name

> **Exemplo 4: Reiniciar serviços que estão parados**

Get-Service \| Where-Object {\$.Status -eq \'Stopped\' } \|
ForEach-Object { \$\_.Start() }

##### 2.3. Variáveis e Tipos de Dados

> **Declaração e Uso de Variáveis**

No PowerShell, variáveis são usadas para armazenar dados temporariamente
durante a execução de scripts e comandos. As variáveis são prefixadas
com o símbolo \$.

> **Declaração de Variáveis**

Para declarar uma variável, basta prefixar o nome da variável com \$ e
atribuir um valor a ela usando o operador =.

> **Exemplos**:

\$nome = \"João\"

\$idade = 30

> **Uso de Variáveis**

- Depois de declarada, uma variável pode ser utilizada em comandos e
  scripts.

- As variáveis podem armazenar diferentes tipos de dados, como strings,
  números, arrays e hashtables.

> **Exemplo de Uso**:

\$nome = \"João\"

\$idade = 30

\$saudacao = \"Olá, meu nome é \$nome e eu tenho \$idade anos.\"

Write-Output \$saudacao

> **Tipos de Dados Comuns**
>
> **Strings**

- Strings são usadas para armazenar texto.

- Podem ser delimitadas por aspas simples (\') ou aspas duplas (\").

- Aspas duplas permitem a interpolação de variáveis.

> **Exemplos**:

\$string1 = \"Texto com variável: \$nome\"

\$string2 = \'Texto sem interpolação de variável: \$nome\'

> **Inteiros**

- Inteiros são números sem casas decimais.

- Usados para armazenar valores numéricos.

> **Exemplo**:

\$numero = 42

> **Arrays**

- Arrays são coleções de elementos que podem ser de diferentes tipos.

- Podem ser criados usando o operador @.

> **Exemplo**:

\$array = @(\"um\", 2, 3.0, \$nome)

\$array\[0\] \# Acessa o primeiro elemento

> **Hashtables**

- Hashtables são coleções de pares chave-valor.

- Usadas para armazenar dados de forma associativa.

> **Exemplo**:

\$hashtable = \@{

\"Nome\" = \"João\"

\"Idade\" = 30

\"Cidade\" = \"São Paulo\"

}

\$hashtable\[\"Nome\"\] \# Acessa o valor associado à chave \"Nome\"

> **Exemplos Práticos**
>
> **Exemplo 1: Declaração e uso de variáveis de diferentes tipos**

\# String

\$nome = \"Ana\"

\# Inteiro

\$idade = 25

\# Array

\$numeros = @(1, 2, 3, 4, 5)

\# Hashtable

\$info = \@{

\"Nome\" = \"Ana\"

\"Idade\" = 25

\"Cidade\" = \"Rio de Janeiro\"

}

\# Uso das variáveis

Write-Output \"Nome: \$nome, Idade: \$idade\"

Write-Output \"Primeiro número: \$(\$numeros\[0\])\"

Write-Output \"Cidade: \$(\$info\[\'Cidade\'\])\"

> **Exemplo 2: Manipulação de Arrays e Hashtables**

\# Array de strings

\$frutas = @(\"Maçã\", \"Banana\", \"Laranja\")

\# Adicionar um item ao array

\$frutas += \"Uva\"

\# Exibir o array

\$frutas

\# Hashtable de informações de um livro

\$livro = \@{

\"Título\" = \"1984\"

\"Autor\" = \"George Orwell\"

\"Ano\" = 1949

}

\# Adicionar uma nova chave-valor

\$livro\[\"Editora\"\] = \"Secker & Warburg\"

\# Exibir a hashtable

\$livro