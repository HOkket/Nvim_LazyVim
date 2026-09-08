-- ~/.config/nvim/lua/config/ui.lua

-- Configurações de transparência centralizadas
local function set_transparency()
  local highlights = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "FloatBorder",
    "SignColumn",
    "LineNr",
    "CursorLine",
    "CursorLineNr",
    "VertSplit",
    "StatusLine",
    "StatusLineNC",
    "EndOfBuffer",
    "NeoTreeNormal",
    "NeoTreeNormalNC",
    "TelescopeNormal",
    "TelescopeBorder",
  }

  for _, hl in ipairs(highlights) do
    vim.api.nvim_set_hl(0, hl, { bg = "none", ctermbg = "none" })
  end
end

-- Aplica a transparência quando o esquema de cores for carregado
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_transparency,
})

-- Aplica imediatamente ao carregar o Neovim
set_transparency()