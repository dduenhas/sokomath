---
name: github-commit
description: Realiza commits e envios (push) para o GitHub garantindo a autoria oficial com a conta dduenhas@gmail.com, seguindo o padrão Conventional Commits e boas práticas de versionamento git.
---

# GitHub Commit Skill (dduenhas@gmail.com)

Esta skill deve ser utilizada sempre que o usuário solicitar para realizar commit, salvar alterações no repositório Git ou fazer push para o GitHub.

## Identidade Obrigatória do Autor
Antes de qualquer commit, esta skill garante e valida que a autoria local está explicitamente associada a:
- **E-mail:** `dduenhas@gmail.com`
- **Nome de Usuário:** `Diego Duenhas`

```powershell
git config user.email "dduenhas@gmail.com"
git config user.name "Diego Duenhas"
```

## Fluxo de Execução Passo a Passo

### 1. Inspecionar o Status e Arquivos Modificados
Verifique o estado atual do repositório antes de preparar o commit:
```powershell
git status --short
```

### 2. Configurar / Confirmar Autoria
Garanta que o commit seja atribuído à conta oficial:
```powershell
git config user.email "dduenhas@gmail.com"
git config user.name "Diego Duenhas"
```

### 3. Adicionar Arquivos (Staging)
Adicione os arquivos modificados e criados do projeto:
```powershell
git add novo-projeto-de-jogo/ README.md .agents/
```
*Atenção:* Nunca faça `git add` em arquivos do sistema operacional, diretórios de perfil de usuário ou credenciais.

### 4. Criar o Commit Padronizado (Conventional Commits)
Gere uma mensagem clara e objetiva com prefixos semânticos:
- `feat:` Nova funcionalidade (ex: novos níveis, botões, modais)
- `fix:` Correção de bug ou ajuste de lógica
- `docs:` Alterações em documentação e guias pedagógicos
- `refactor:` Refatoração e aprimoramento de arquitetura
- `style:` Ajustes cosméticos de UI, cores ou responsividade

Exemplo de comando:
```powershell
git commit -m "feat(a11y): adicionar painel de acessibilidade, justificativa BNCC e controles touch"
```

### 5. Conferir o Registro do Commit
Valide se o commit foi gerado com o autor correto:
```powershell
git log -1 --format="Autor: %an <%ae>%nData: %ad%nMensagem: %s"
```

### 6. Enviar para o Remoto (Push)
Se o terminal necessitar de autenticação de credenciais com o GitHub CLI conectado:
```powershell
gh auth setup-git
```
Envie para o branch principal ou o branch ativo no GitHub:
```powershell
git push -u origin main
```
