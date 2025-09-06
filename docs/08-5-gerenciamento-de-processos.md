# 5. Gerenciamento de processos

Gerenciar processos em um sistema operacional é uma das tarefas mais
comuns e essenciais para administradores de sistemas e usuários
avançados. O PowerShell oferece uma série de cmdlets e funções que
permitem monitorar, listar, e manipular processos de maneira eficiente.
Neste tópico, exploraremos como trabalhar com processos em execução,
como utilizar o comando Tasklist, e como finalizar processos
específicos.

##### 5.1 Processos em Execução

Um processo em execução é um programa ou aplicação que está atualmente
sendo executado no sistema. Cada processo é identificado por um
identificador único (PID - Process Identifier) e possui várias
propriedades associadas, como nome, uso de memória, tempo de CPU, entre
outras.

**Listar Processos em Execução**

- **Get-Process**: O cmdlet Get-Process é usado para listar todos os
  processos que estão atualmente em execução no sistema. Ele exibe
  informações detalhadas sobre cada processo, incluindo o nome, PID, uso
  de CPU, memória, entre outros.

**Exemplo**:

Get-Process

**Filtrar Processos Específicos**: Você pode filtrar a lista de
processos para exibir apenas aqueles que correspondem a um nome
específico.

Get-Process -Name \"notepad\"

**Filtrar por PID**: Para obter informações sobre um processo específico
usando seu PID, use o parâmetro -Id.

Get-Process -Id 1234

**Exibir Processos em Ordem de Uso de CPU**: Para listar os processos em
ordem de uso de CPU, use Sort-Object.

Get-Process \| Sort-Object -Property CPU -Descending

**Monitoramento de Processos em Tempo Real**

- **Atualização Contínua de Processos**: Para monitorar os processos em
  tempo real, você pode utilizar um loop que atualiza constantemente a
  lista de processos.

while (\$true) {

Get-Process

Start-Sleep -Seconds 5

Clear-Host

}

##### 5.2 Utilizando o Comando Tasklist

Embora o Get-Process seja uma ferramenta poderosa, o comando Tasklist,
que é um comando embutido no Windows, oferece uma alternativa para
listar processos em execução. Tasklist é comumente utilizado em scripts
de linha de comando (cmd) e pode ser chamado diretamente do PowerShell.

**Listar Processos com Tasklist**

- **Comando Básico**: O comando básico para listar processos em execução
  usando Tasklist é:

tasklist

**Filtrar Processos por Nome**: Para listar processos específicos com
base no nome, use o parâmetro /FI para definir um filtro.

tasklist /FI \"IMAGENAME eq chrome.exe\"

**Exibir Detalhes de Memória**: Você pode obter detalhes mais
específicos, como o uso de memória, para processos em execução.

**Processos em execução**

tasklist /FI \"IMAGENAME eq chrome.exe\" /FO LIST

- **/svc**: Lista todos os serviços em cada processo.

> A opção /fi no comando tasklist é usada para aplicar filtros
> específicos aos processos listados.

- **/fi \[filtro\]**: Exibe um conjunto de tarefas que correspondem ao
  critério especificado pelo filtro.

tasklist /fi \"cputime gt 00:10:00\"

> Explicação dos Parâmetros
>
> **/fi**: Especifica um filtro a ser aplicado à lista de processos.
>
> **\"cputime gt 00:10:00\"**: Define o critério do filtro:
>
> cputime: Refere-se ao tempo de CPU que o processo tem usado.
>
> gt: Significa \"greater than\" (maior que).
>
> 00:10:00: Especifica o valor do tempo em horas, minutos e segundos.
>
> **PID eq \[número\]**: Filtra por ID do processo

- tasklist /fi \"PID eq 1234\"

> **Status eq \[estado\]**: Filtra por status (RUNNING, NOT RESPONDING).

- tasklist /fi \"status eq running\"

> **/fo \[formato\]**: Especifica o formato de saída.

tasklist /fi \"cputime gt 00:10:00\" /fo table

![](media/image6.png){width="5.175254811898513in"
height="1.0589031058617673in"}

### Cenários de Uso

> **Diagnóstico de Desempenho**: Administradores de sistemas podem usar
> esse filtro para identificar processos que estão consumindo uma
> quantidade significativa de tempo de CPU, o que pode ajudar a
> identificar gargalos de desempenho ou processos que podem estar
> travados ou em loop.
>
> **Monitoramento de Recursos**: Em servidores onde o uso de CPU é
> crítico, esse comando pode ajudar a monitorar e gerenciar processos
> que estão utilizando recursos excessivamente.
>
> **LIST**: Formato de lista.

- tasklist /fo list

- tasklist /fo csv

  - tasklist /fo csv \>\>task.csv -- Salva em um arquivo

  - /v : Exibe informações detalhadas sobre cada tarefa.

  - tasklist /fo csv /v

##### 5.3 Finalizar um Processo Específico

Finalizar um processo é uma operação crítica, geralmente usada para
interromper aplicativos que não estão respondendo ou para liberar
recursos do sistema.

**Finalizar um Processo com PowerShell**

- Stop-Process: O cmdlet Stop-Process é usado para finalizar processos
  diretamente do PowerShell. Você pode especificar o processo a ser
  finalizado usando o nome ou o PID.

  - **Finalizar por Nome**:

Stop-Process -Name \"chrome\"

**Finalizar por PID**:

Stop-Process -Id 1234

**Forçar Finalização**: Para forçar a finalização de um processo que não
está respondendo, use o parâmetro -Force.

Stop-Process -Name \"notepad\" -Force

> O comando **taskkill** no Windows é usado para finalizar processos em
> execução. A opção **/IM** especifica o nome da imagem (processo) a ser
> finalizado, e a opção **/F** força a finalização do processo. Vamos
> explicar cada parte do comando
>
> **taskkill /IM nomeDoProcesso.exe /F.**
>
> **Parâmetros**
>
> **/IM \[nomeDoProcesso.exe\]**: Especifica o nome da imagem do
> processo que você deseja finalizar. O nome do processo geralmente
> termina com .exe.
>
> **/F**: Força a finalização do processo. Sem esta opção, o comando
> **taskkill** solicita uma finalização graciosa do processo. Com /F,
> ele força a finalização, independentemente de o processo estar
> respondendo ou não.
>
> **Cenários de Uso**
>
> **Finalizar Processos Não Responsivos**: Se um programa travar e não
> responder, você pode usar o comando **taskkill** com a opção **/F**
> para forçar a finalização do processo.
>
> **Gerenciamento de Processos**: Administradores de sistemas podem usar
> este comando para gerenciar e finalizar processos em execução que
> estão consumindo muitos recursos ou que foram iniciados por engano.