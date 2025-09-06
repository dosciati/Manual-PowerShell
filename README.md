<p align="center">
  <img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell"/>
  <img src="https://img.shields.io/badge/Automation-4CAF50?style=for-the-badge&logo=githubactions&logoColor=white" alt="Automation"/>
  <img src="https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white" alt="Windows"/>
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black" alt="Linux"/>
  <img src="https://img.shields.io/badge/macOS-000000?style=for-the-badge&logo=apple&logoColor=white" alt="macOS"/>
</p>

# ⚡ Manual de PowerShell

> Material desenvolvido para a turma do **2º ano do Técnico em Informática do IFRS – Restinga**  
> 📘 Apostila completa em PDF: `docs/assets/apostila.pdf`  
> 🌐 Site (MkDocs + Material): https://dosciati.github.io/Manual-PowerShell/

O **PowerShell** é mais do que uma linha de comando: é uma plataforma de **automação e administração multiplataforma** (Windows, Linux e macOS).  
Este manual é **prático e didático**, cobrindo de fundamentos a **automação de tarefas reais** com exemplos reutilizáveis.

---

## 🔗 Links Rápidos

- **Site**: https://dosciati.github.io/Manual-PowerShell/  
- **PDF da apostila**: `docs/assets/apostila.pdf`  
- **Docs (fonte do site)**: `docs/`  
- **Workflow Pages**: `.github/workflows/pages.yml`

---

## 🚀 Destaques

- **Guia completo**: capítulos temáticos (Fundamentos, Administração, Rede, Armazenamento, Segurança, Automação).  
- **Receitas & Scripts**: exemplos prontos em `docs/exemplos/*.ps1` e página `guia/07_receitas.md`.  
- **Site estático** com **MkDocs + Material** (busca, TOC, copiar código, tema escuro).  
- **Deploy automático** no **GitHub Pages** via GitHub Actions.

---

## Instalação & Uso Local

```bash
git clone https://github.com/dosciati/Manual-PowerShell.git
cd Manual-PowerShell
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

---

## Estrutura do Repositório

```
Manual-PowerShell/
├─ mkdocs.yml
├─ requirements.txt
├─ README.md
├─ .github/
│  └─ workflows/
│     └─ pages.yml
└─ docs/
   ├─ index.md
   ├─ guia/
   │  ├─ 00_apostila_convertida.md
   │  ├─ 01_introducao.md
   │  ├─ 02_basico.md
   │  ├─ 03_modulos.md
   │  ├─ 04_scripting.md
   │  ├─ 05_boas_praticas.md
   │  ├─ 06_exemplos.md
   │  ├─ 07_receitas.md
   │  ├─ 10_fundamentos.md
   │  ├─ 11_administracao.md
   │  ├─ 12_rede.md
   │  ├─ 13_armazenamento.md
   │  ├─ 14_seguranca.md
   │  └─ 15_automacao.md
   ├─ exemplos/
   │  ├─ Get-InstalledSoftware.ps1
   │  ├─ Clean-Temp.ps1
   │  └─ Check-UAC.ps1
   └─ assets/
      └─ apostila.pdf
```

---

## Publicar no GitHub Pages (CI/CD)

1. **Settings → Pages → Build and deployment → Source = GitHub Actions**  
2. **Settings → Actions → General → Workflow permissions = Read and write permissions**  
3. `git push` → o workflow publica em: https://dosciati.github.io/Manual-PowerShell/
