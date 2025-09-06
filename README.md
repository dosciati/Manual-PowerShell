
# Site MkDocs — Manual PowerShell

Este repositório foi gerado a partir de um único arquivo Markdown e convertido para um site MkDocs (tema Material).

## Estrutura
```
mkdocs.yml
docs/
  index.md
  01-*.md
  02-*.md
  ...
  media/        # coloque aqui as imagens, se houver
```

## Como rodar localmente
1. Instale o MkDocs e o tema Material:
   ```bash
   pip install -r requirements.txt
   ```
2. Suba o servidor de desenvolvimento:
   ```bash
   mkdocs serve
   ```
   Acesse http://127.0.0.1:8000

## Como publicar no GitHub Pages
1. Faça commit de todos os arquivos deste projeto em um repositório no GitHub.
2. No GitHub, vá em **Settings → Pages → Build and deployment**:
   - **Source**: GitHub Actions
3. Adicione o workflow padrão (o Material já oferece um modelo) ou use:
   ```yaml
   name: deploy

   on:
     push:
       branches:
         - main
     workflow_dispatch:

   jobs:
     deploy:
       runs-on: ubuntu-latest
       steps:
         - uses: actions/checkout@v4
         - uses: actions/setup-python@v5
           with:
             python-version: '3.x'
         - run: pip install -r requirements.txt
         - run: mkdocs gh-deploy --force
   ```
4. Faça um push para a branch `main`. O GitHub Pages publicará automaticamente.

## Observações
- Se o documento original fazia referência a imagens (ex.: `media/image1.png`), coloque esses arquivos em `docs/media/` com os **mesmos nomes**.
- Você pode reorganizar o menu (nav) editando o `mkdocs.yml`.

Bom proveito! 🚀
