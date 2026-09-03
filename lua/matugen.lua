 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a2323',
    base01 = '#2b3b3a',
    base02 = '#263635',
    base03 = '#5e6e6d',
    base04 = '#afb6b6',
    base05 = '#f2f3f3',
    base06 = '#f2f3f3',
    base07 = '#f2f3f3',
    base08 = '#fd4663',
    base09 = '#8387af',
    base0A = '#819fb1',
    base0B = '#8bc1bc',
    base0C = '#afb2d0',
    base0D = '#acd3cf',
    base0E = '#afc3d0',
    base0F = '#cddce4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f2f3f3',          bg = '#1a2323' })
  hi('TelescopeBorder',         { fg = '#5e6e6d',             bg = '#1a2323' })
  hi('TelescopePromptNormal',   { fg = '#f2f3f3',          bg = '#1a2323' })
  hi('TelescopePromptBorder',   { fg = '#5e6e6d',             bg = '#1a2323' })
  hi('TelescopePromptPrefix',   { fg = '#8bc1bc',             bg = '#1a2323' })
  hi('TelescopePromptCounter',  { fg = '#afb6b6',  bg = '#1a2323' })
  hi('TelescopePromptTitle',    { fg = '#1a2323',             bg = '#8bc1bc' })
  hi('TelescopePreviewTitle',   { fg = '#1a2323',             bg = '#819fb1' })
  hi('TelescopeResultsTitle',   { fg = '#1a2323',             bg = '#8387af' })
  hi('TelescopeSelection',      { fg = '#f2f3f3',          bg = '#263635' })
  hi('TelescopeSelectionCaret', { fg = '#8bc1bc',             bg = '#263635' })
  hi('TelescopeMatching',       { fg = '#8bc1bc',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
