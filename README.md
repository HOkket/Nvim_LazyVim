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
│   │   ├── ai.lua        # Copilot (ghost) e OpenCode (chat/agente)
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

### IA (OpenCode + Copilot)
- **[copilot.lua](https://github.com/zbirenbaum/copilot.lua)** — sugestões ghost inline do Copilot.
- **[opencode.nvim](https://github.com/nickjvandyke/opencode.nvim)** — integração com o OpenCode v2: envia contexto do editor (`@this`, `@buffer`, `@diagnostics`), executa comandos e revisa edições com `:diffpatch`.
- O OpenCode precisa estar instalado e autenticado (`opencode auth login`).

### UI/Visual
- Transparência total (arquivo `lua/config/ui.lua`) aplicada no `ColorScheme`.
- Tema base16 dinâmico gerado pelo **Matugen** (`lua/matugen.lua`), com recarga automática ao receber o sinal `SIGUSR1`.
- **blink.cmp** para autocomplete — documentação manual com `<C-a>` (auto-show desativado).

### Produtividade
- **[code_runner.nvim](https://github.com/CRAG666/code_runner.nvim)** — executa o arquivo atual (Python, JS, Go, Rust, C) num terminal.
- **[nvim-dbee](https://github.com/kndndrj/nvim-dbee)** — consulta a bancos SQL.
- **[venv-selector.nvim](https://github.com/linux-cultist/venv-selector.nvim)** — seleção de virtualenvs Python.

## Atalhos Principais

### IA (OpenCode / Copilot)
| Atalho | Ação |
| --- | --- |
| `<leader>oa` | Perguntar ao OpenCode (`@this`) |
| `<leader>os` | Selecionar ação do OpenCode |
| `<leader>or` | Enviar seleção/linha ao OpenCode (operator) |
| `<leader>oc` | Executar comando do OpenCode |
| `<C-.>` | Alternar terminal do OpenCode (lateral direita) |
| `<leader>cp` | Alternar sugestões ghost do Copilot |
| `<leader>icm` | Alternar Copilot no menu de sugestões |
| `<M-p>` | Ativar/renovar sugestão ghost |
| `<M-l>` | Aceitar sugestão ghost |

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