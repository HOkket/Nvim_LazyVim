# Minha Configuração do Neovim (LazyVim)

Esta é a minha configuração pessoal do Neovim, baseada no framework [LazyVim](https://lazyvim.github.io/).

## Estrutura da Configuração

```text
~/.config/nvim/
├── init.lua              # Ponto de entrada
├── lazy-lock.json        # Versões dos plugins
├── lazyvim.json          # Configuração dos extras do LazyVim
├── lua/
│   ├── config/           # Configurações globais
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua      # Configuração do gerenciador de plugins (lazy.nvim)
│   │   ├── options.lua
│   │   └── ui.lua        # Configurações de UI e Transparência
│   ├── plugins/          # Definições específicas de plugins
│   │   ├── ai.lua        # Copilot e CodeCompanion
│   │   ├── base16.lua
│   │   ├── cmp.lua       # Configurações do blink.cmp
│   │   ├── code-runner.lua
│   │   └── dbee.lua      # Banco de dados
│   └── matugen.lua       # Integração com Matugen (temas)
└── stylua.toml           # Configuração do formatador
```

## Principais Funcionalidades e Plugins

- **Framework:** LazyVim.
- **Gerenciador de Plugins:** [lazy.nvim](https://github.com/folke/lazy.nvim).
- **IA (Assistência):**
  - [copilot.lua](https://github.com/zbirenbaum/copilot.lua)
  - [codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim) para chat, explicação de código, correção e testes.
- **UI/Visual:**
  - Suporte total a transparência (configurado em `lua/config/ui.lua`).
  - Base16 para temas.
  - [blink.cmp](https://github.com/saghen/blink.cmp) para preenchimento automático.
- **Produtividade:**
  - [code_runner.nvim](https://github.com/CRAG666/code_runner.nvim) para execução de código.
  - [nvim-dbee](https://github.com/kndndrj/nvim-dbee) para gerenciamento de banco de dados.

## Atalhos Principais (Keymaps)

### IA (CodeCompanion)
- `<leader>ac`: Toggle Chat
- `<leader>ai`: Inline Assist
- `<leader>aa`: Ações rápidas
- `<leader>ae`: Explicar seleção (visual)
- `<leader>af`: Corrigir seleção (visual)
- `<leader>at`: Gerar testes (visual)

### Runner (Code Runner)
- `<leader>rr`: Run Code (Automático)
- `<leader>rf`: Run Current File
- `<leader>rp`: Run Project
- `<leader>rc`: Close Runner

## Como Instalar

1. Certifique-se de ter o Neovim (>= 0.10) instalado.
2. Clone este repositório em `~/.config/nvim`:
   ```bash
   git clone https://github.com/HOkket/Nvim---Backup ~/.config/nvim
   ```
3. Abra o Neovim. O `lazy.nvim` irá baixar e instalar automaticamente todos os plugins configurados.
