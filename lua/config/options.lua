-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Mantém o Copilot apenas em modo ghost (virtual text), sem aparecer
-- como item no menu de sugestões do blink.cmp/fang2hou/blink-copilot.
vim.g.ai_cmp = false

-- Evita o E325 (swap file) ao abrir buffers pelo snacks picker.
-- O histórico de desfazer persistente (undofile) continua ativo.
vim.opt.swapfile = false

-- Controla se o Copilot aparece como item no menu do blink.cmp.
-- O ghost text é controlado separadamente em lua/plugins/ai.lua.
vim.g.copilot_cmp_menu = false
