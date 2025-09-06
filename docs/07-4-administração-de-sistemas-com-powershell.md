# 4. Administração de Sistemas com PowerShell

O PowerShell é uma ferramenta poderosa para a administração de sistemas,
proporcionando aos administradores uma maneira eficiente e flexível de
gerenciar e automatizar uma vasta gama de tarefas de administração de
sistemas. Abaixo, exploramos os principais tópicos e comandos que
capacitam os administradores a gerenciar sistemas Windows e ambientes
multiplataforma com PowerShell.

##### 4.1. Gerenciamento de Usuários e Grupos

**Criação, Modificação e Exclusão de Usuários**

- **Criar Novo Usuário**: O cmdlet New-LocalUser é usado para criar
  novos usuários locais em uma máquina Windows.

New-LocalUser -Name \"NovoUsuario\" -Password (ConvertTo-SecureString
\"SenhaSegura123\" -AsPlainText -Force) -FullName \"Nome Completo\"
-Description \"Descrição do Usuário\"

**Modificar Usuário**: Para modificar as propriedades de um usuário,
você pode usar o cmdlet Set-LocalUser.

Set-LocalUser -Name \"NovoUsuario\" -FullName \"Nome Completo
Atualizado\" -Description \"Descrição Atualizada\"

**Excluir Usuário**: Para excluir um usuário, utilize o cmdlet
Remove-LocalUser.

Remove-LocalUser -Name \"NovoUsuario\"

**Gerenciamento de Grupos**

- **Criar Novo Grupo**: Use New-LocalGroup para criar grupos locais.

New-LocalGroup -Name \"NovoGrupo\" -Description \"Descrição do Grupo\"

- **Adicionar Usuário a um Grupo**: O cmdlet Add-LocalGroupMember
  adiciona um usuário a um grupo específico.

Add-LocalGroupMember -Group \"Administradores\" -Member \"NovoUsuario\"

- **Remover Usuário de um Grupo**: Para remover um usuário de um grupo,
  use Remove-LocalGroupMember.

Remove-LocalGroupMember -Group \"Administradores\" -Member
\"NovoUsuario\"

- **Excluir Grupo**: Para excluir um grupo, use Remove-LocalGroup.

Remove-LocalGroup -Name \"NovoGrupo\"

##### 4.2. Gerenciamento de Processos e Serviços

**Gerenciamento de Processos**

- **Listar Processos**: Use Get-Process para listar todos os processos
  em execução.

Get-Process

- **Finalizar Processos**: Para finalizar um processo específico, use
  Stop-Process.

Stop-Process -Name \"notepad\"

- **Iniciar Novos Processos**: Inicie um novo processo com
  Start-Process.

Start-Process \"notepad.exe\"

**Gerenciamento de Serviços**

- **Listar Serviços**: Para listar todos os serviços no sistema, use
  Get-Service.

Get-Service

**Iniciar, Parar e Reiniciar Serviços**:

- Iniciar um serviço:

Start-Service -Name \"NomeDoServico\"

- Parar um serviço:

Stop-Service -Name \"NomeDoServico\"

- Reiniciar um serviço:

Restart-Service -Name \"NomeDoServico\"

**Alterar o Tipo de Inicialização de um Serviço**: Para alterar o tipo
de inicialização de um serviço (Manual, Automático, Desativado), use o
cmdlet Set-Service.

Set-Service -Name \"NomeDoServico\" -StartupType Automatic

##### 4.3. Gerenciamento de Discos e Sistema de Arquivos

**Gerenciamento de Discos**

- **Listar Informações sobre Discos**: Use o cmdlet Get-PhysicalDisk
  para obter informações sobre os discos físicos.

Get-PhysicalDisk

- **Gerenciamento de Volumes e Partições**: Use Get-Volume para listar
  todos os volumes e Get-Partition para listar as partições.

Get-Volume

Get-Partition

- **Formatar Volume**: Para formatar um volume, use Format-Volume.

Format-Volume -DriveLetter D -FileSystem NTFS -Confirm:\$false

**Gerenciamento de Sistema de Arquivos**

- **Gerenciamento de Permissões (ACLs)**: As listas de controle de
  acesso (ACLs) podem ser gerenciadas com os cmdlets Get-Acl, Set-Acl, e
  New-Object (para criar regras).

  - **Exibir ACLs**: (Ampliar este conteúdo com os detalhes do comando)

Get-Acl -Path \"C:\\windows\"

- **Modificar ACLs**:

> \$acl = Get-Acl -Path \"C:\\PastaExemplo\"
>
> \$rule = New-Object
> System.Security.AccessControl.FileSystemAccessRule(\"Usuario\",
> \"FullControl\", \"Allow\")
>
> \$acl.SetAccessRule(\$rule)
>
> Set-Acl -Path \"C:\\PastaExemplo\" -AclObject \$acl

- **Compactar e Descompactar Arquivos**: Para compactar arquivos em um
  arquivo ZIP, use Compress-Archive, e para descompactar, use
  Expand-Archive.

Compress-Archive -Path \"C:\\Pasta\\\*.\*\" -DestinationPath
\"C:\\Backup\\Arquivo.zip\"

Expand-Archive -Path \"C:\\Backup\\Arquivo.zip\" -DestinationPath
C:\\PastaRestaurada\"

##### 4.4. Gerenciamento de Rede

**Configuração de Rede**

- **Obter Informações de Rede**: Use Get-NetIPAddress para obter
  informações sobre os endereços IP configurados no sistema.

Get-NetIPAddress

- **Configurar Endereço IP Estático**: Use New-NetIPAddress para
  configurar um endereço IP estático.

New-NetIPAddress -InterfaceAlias \"Ethernet\" -IPAddress
\"192.168.1.100\" -PrefixLength 24 -DefaultGateway \"192.168.1.1\"

- **Configurar DNS**: Para configurar servidores DNS, use
  Set-DnsClientServerAddress.

Set-DnsClientServerAddress -InterfaceAlias \"Ethernet\" -ServerAddresses
(\"8.8.8.8\", \"8.8.4.4\")

**Testes de Conectividade e Diagnóstico**

- **Ping e Testes de Conectividade**: Use Test-Connection para verificar
  a conectividade com outro dispositivo na rede.

Test-Connection -ComputerName \"www.google.com\" -Count 4

- **Monitoramento de Conexões de Rede**: Use Get-NetTCPConnection para
  monitorar as conexões TCP ativas.

Get-NetTCPConnection

##### 4.5. Gerenciamento de Políticas de Grupo e Segurança Políticas de Grupo (GPO)

- **Obter Configurações de Políticas de Grupo**: Para listar as
  configurações aplicadas por GPOs, use Get-GPResultantSetOfPolicy.

Get-GPResultantSetOfPolicy -Computer \"NomeDoComputador\" -ReportType
Html -Path \"C:\\Relatorios\\GPO-Relatorio.html\"

**Aplicar Configurações de Políticas de Grupo**: Use gpupdate para
forçar a aplicação das políticas de grupo.

gpupdate /force

**Gerenciamento de Políticas de Segurança**

- **Configuração de Políticas de Segurança**: Use Set-ExecutionPolicy
  para configurar a política de execução de scripts no PowerShell.

Set-ExecutionPolicy RemoteSigned

- **Monitoramento de Eventos de Segurança**: Use Get-EventLog para
  monitorar logs de eventos de segurança.

Get-EventLog -LogName Security -Newest 50 #Deve ser executado no
terminal do PowerShell como Administrador!

##### 4.6. Automação de Tarefas e Agendamento

**Agendamento de Tarefas**

- **Criar uma Tarefa Agendada**: Use New-ScheduledTask e
  Register-ScheduledTask para criar e registrar uma tarefa agendada.

\$action = New-ScheduledTaskAction -Execute \"PowerShell.exe\" -Argument
\"-File C:\\Scripts\\Backup.ps1\"

\$trigger = New-ScheduledTaskTrigger -Daily -At \"03:00AM\"

Register-ScheduledTask -Action \$action -Trigger \$trigger -TaskName
\"BackupDiario\" -Description \"Backup diário do sistema\"

**Gerenciar Tarefas Agendadas**: Use Get-ScheduledTask,
Set-ScheduledTask e Unregister-ScheduledTask para gerenciar tarefas
existentes.

Get-ScheduledTask -TaskName \"BackupDiario\"

**Automação com Scripts**

- **Automatizar Backups**: Crie scripts que automatizem o backup de
  dados importantes, executando-os regularmente através de tarefas
  agendadas.

\# Script de backup

Copy-Item -Path \"C:\\DadosImportantes\" -Destination
\"D:\\Backups\\\$(Get-Date -Format yyyyMMdd)\" -Recurse

- **Monitoramento Automático**: Configure scripts que monitorem serviços
  críticos e enviem alertas em caso de falha.

\# Script de monitoramento

if (-not (Get-Service -Name \"NomeDoServico\" -ErrorAction
SilentlyContinue).Status -eq \'Running\') {

Send-MailMessage -To \"admin@example.com\" -From \"monitor@example.com\"
-Subject \"Serviço Parado\" -Body \"O serviço NomeDoServico parou.\"
-SmtpServer \"smtp.example.com\"

}