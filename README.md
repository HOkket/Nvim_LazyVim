# Minha Configuração do Neovim (LazyVim)

Configuração pessoal do [Neovim](https://neovim.io/) baseada no framework [LazyVim](https://lazyvim.github.io/), gerenciada com o [lazy.nvim](https://github.com/folke/lazy.nvim).

## Estrutura da Configuração

```text
~/.config/nvim/
├── init.lua              # Ponto de entrada de bootstrap
├── lazyvim.json          # Extras ativados do LazyVim
├── lazy-lock.json        # Versões (commits) travadas dos plugins
├── stylua.toml           # Configuração do formatador StyLua
├── lua/
│   ├── config/           # Configurações globais
│   │   ├── lazy.lua      # Bootstrap e setup do lazy.nvim
│   │   ├── options.lua   # Opções adicionais do Neovim
│   │   ├── keymaps.lua   # Keymaps adicionais
│   │   ├── autocmds.lua  # Autocmds adicionais
│   │   └── ui.lua        # Transparência (autocmd ColorScheme + aplicação imediata)
│   ├── plugins/          # Definições específicas de plugins
│   │   ├── ai.lua        # Copilot (autocomplete) e CodeCompanion (chat/inline)
│   │   ├── base16.lua    # Tema base16 + integração com matugen
│   │   ├── cmp.lua       # Ajustes do blink.cmp (documentação)
│   │   ├── code-runner.lua # Execução de código
│   │   ├── dbee.lua      # Banco de dados SQL
│   │   └── venv.lua      # Seleção de venvs Python
│   └── matugen.lua       # Tema base16 gerado pelo Matugen (com hot-reload via SIGUSR1)
```

## Extras do LazyVim

Ativados em `lazyvim.json`:

| Extra | Função |
| --- | --- |
| `ai.copilot` | Sugestões do GitHub Copilot |
| `editor.overseer` | Gerenciamento de tarefas (tasks) |
| `lang.docker` | Suporte a Dockerfile / compose |
| `lang.git` | Git integrado ao editor |
| `lang.json` | JSON + schema associados |
| `lang.markdown` | Markdown renderizado |
| `lang.python` | LSP, testes e ferramentas Python |
| `lang.sql` | Banco de dados (vim-dadbod) |
| `lang.yaml` | YAML |
| `test.core` | Neotest (testes) |
| `ui.mini-indentscope` | Indentação visual |
| `util.gitui` | Interação com git via gitui |

## Funcionalidades e Plugins

### IA (CodeCompanion + Copilot)
- **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)** — autocomplete inline do Copilot (inserção).
- **[codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim)** — chat, comandos inline e ações de IA, com **dois adaptadores disponíveis**:
  - **Copilot** (HTTP) — padrão dos chats, modelo `gpt-4.1`.
  - **OpenCode** (ACP) — via `opencode acp`. Para alternar dentro do chat, use `ga`.
- O assistant responde em português por padrão.

### UI/Visual
- Transparência total (arquivo `lua/config/ui.lua`) aplicada no `ColorScheme`.
- Tema base16 dinâmico gerado pelo **Matugen** (`lua/matugen.lua`), com recarga automática ao receber o sinal `SIGUSR1`.
- **blink.cmp** para autocomplete — documentação manual com `<C-a>` (auto-show desativado).

### Produtividade
- **[code_runner.nvim](https://github.com/CRAG666/code_runner.nvim)** — executa o arquivo atual (Python, JS, Go, Rust, C) num terminal.
- **[nvim-dbee](https://github.com/kndndrj/nvim-dbee)** — consulta a bancos SQL.
- **[venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim)** — seleção de virtualenvs Python.

## Atalhos Principais

### IA (CodeCompanion)
| Atalho | Ação |
| --- | --- |
| `<leader>ac` | Alternar chat de IA (Copilot/OpenCode) |
| `<leader>ai` | IA inline |
| `<leader>aa` | Ações rápidas de IA |
| `<leader>ae` | Explicar seleção (visual) |
| `<leader>af` | Corrigir seleção (visual) |
| `<leader>at` | Gerar testes (visual) |
| `ga` (dentro do chat) | Trocar adaptador/modelo |

### Runner (Code Runner)
| Atalho | Ação |
| --- | --- |
| `<leader>rr` | Run Code (automático) |
| `<leader>rf` | Run Current File |
| `<leader>rp` | Run Project |
| `<leader>rc` | Fechar o runner |

### Outros
| Atalho | Ação |
| --- | --- |
| `,v` | Selecionar venv Python |
| `<C-a>` | Abrir/fechar documentação do autocomplete |

## Como Instalar

1. Tenha o **Neovim >= 0.10** instalado.
2. Clone o repositório em `~/.config/nvim`:
   ```bash
   git clone https://github.com/HOkket/Nvim---Backup ~/.config/nvim
   ```
3. Abra o Neovim. O `lazy.nvim` instala e configura automaticamente todos os plugins.

## Dependências Externas

- `git`, `node` (Copilot), `rustc`/`gcc`/`python3`/`go` (code runner).
- `opencode` (se quiser usar o OpenCode como adaptador de IA).
- `matugen` (para regenerar o tema base16 ao trocar o wallpaper).