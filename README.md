<p align="center">
  <img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell"/>
  <img src="https://img.shields.io/badge/Automation-4CAF50?style=for-the-badge&logo=githubactions&logoColor=white" alt="Automation"/>
  <img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Windows"/>
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux"/>
  <img src="https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS"/>
</p>

# ⚡ Manual de PowerShell

> Material desenvolvido para a turma do **2º ano do Técnico em Informática do IFRS – Restinga**  
> 📘 Apostila completa disponível em PDF: [Clique para baixar](https://github.com/dosciati/Manual-PowerShell/blob/main/docs/Manual%20de%20PowerShell.pdf)
---
> 📘 Visite a apostila on-line [Clique para acessar](https://dosciati.github.io/Manual-PowerShell)

O **PowerShell** é muito mais que uma linha de comando: é uma plataforma de automação e administração de sistemas multiplataforma, usada em ambientes **Windows, Linux e macOS**.  
Este manual foi criado para servir como **guia prático e didático**, trazendo desde fundamentos até exemplos avançados de **automação de tarefas reais**.

---

## 🚀 Destaques do Material

### 🛠️ Scripts Práticos
Este repositório não é apenas teoria — inclui exemplos que podem ser usados **no dia a dia de administradores de sistemas**:

1. **Backup Automático de Documentos**  
   ```powershell
   Copy-Item -Path "C:\Dados" -Destination "D:\Backup\$(Get-Date -Format yyyyMMdd)" -Recurse
   ```

2. **Limpeza de Arquivos Temporários**
   ```powershell
   $temp = $env:TEMP
   Get-ChildItem -Path $temp -Recurse | Remove-Item -Force
   ```

3. **Monitoramento de Processos em Tempo Real**
   ```powershell
   while ($true) {
       Get-Process | Sort-Object CPU -Descending | Select-Object -First 5
       Start-Sleep -Seconds 10
       Clear-Host
   }
   ```

4. **Sincronização de Diretórios com Robocopy**
   ```powershell
   Start-Process robocopy.exe "C:\Projetos" "D:\Backup\Projetos" "/MIR /R:5 /W:10"
   ```

5. **Criação de Ponto de Restauração do Sistema**
   ```powershell
   Checkpoint-Computer -Description "Restauração Automática" -RestorePointType MODIFY_SETTINGS
   ```

---

## 🎯 Objetivos do Projeto
- Ensinar **fundamentos essenciais** do PowerShell.  
- Fornecer **scripts prontos para uso** no dia a dia de TI.  
- Desenvolver a visão de **automação e administração de sistemas**.  
- Servir como **material de apoio** para alunos e profissionais iniciantes.

---

## 📚 Recursos Adicionais
- **Documentação oficial Microsoft:** https://learn.microsoft.com/powershell  
- **Repositório oficial do PowerShell:** https://github.com/PowerShell/PowerShell  
- **Tutoriais práticos no YouTube:** pesquise por *PowerShell Scripts Básicos* para exemplos em vídeo.

---
## 👨‍🏫 Autor

**André Dosciati**  
Especialista em **Redes | Dados e Segurança** **|** **Educador em Tecnologia**  
🔗 **LinkedIn:** https://www.linkedin.com/in/andredosciati/  
🔗 **GitHub:** https://github.com/dosciati
