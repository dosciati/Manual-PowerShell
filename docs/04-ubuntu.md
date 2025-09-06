# Ubuntu:

- Abra o Terminal.

- Execute os comandos:

sudo apt-get update

sudo apt-get install -y wget apt-transport-https
software-properties-common

wget -q
https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb

sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update

sudo apt-get install -y powershell

- Execute o PowerShell com o comando: pwsh

[]{#_Toc175688163 .anchor}2 CentOS:

- Abra o Terminal.

- Execute os comandos:

sudo yum install -y wget

wget -q
https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm

sudo rpm -Uvh packages-microsoft-prod.rpm

sudo yum install -y powershell

- Execute o PowerShell com o comando: pwsh

**Configurações Básicas e Perfil de Usuário**

- **Perfis do PowerShell**: Arquivos de script que são executados
  automaticamente quando o PowerShell é iniciado. Localizações típicas:

- Windows:
  C:\\Users\\\<username\>\\Documents\\PowerShell\\Microsoft.PowerShell_profile.ps1

- macOS/Linux: \~/.config/powershell/Microsoft.PowerShell_profile.ps1

Para criar ou editar um perfil:

1.  Abra o PowerShell.

2.  Verifique se o perfil existe com: Test-Path \$PROFILE

3.  Se não existir, crie o perfil com: New-Item -Path \$PROFILE -Type
    File -Force

4.  Edite o perfil com: notepad \$PROFILE (Windows) ou nano \$PROFILE
    (macOS/Linux).

5.  Adicione comandos, alias ou funções que deseja executar ao iniciar o
    PowerShell.