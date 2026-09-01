 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#1a1e23',
    base01 = '#2b323b',
    base02 = '#262d36',
    base03 = '#626972',
    base04 = '#afb2b6',
    base05 = '#f2f2f3',
    base06 = '#f2f2f3',
    base07 = '#f2f2f3',
    base08 = '#fd4663',
    base09 = '#cfbfdb',
    base0A = '#c1bfdb',
    base0B = '#becbdc',
    base0C = '#c2add1',
    base0D = '#acbdd2',
    base0E = '#b0add1',
    base0F = '#cfcde4',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#f2f2f3',          bg = '#1a1e23' })
  hi('TelescopeBorder',         { fg = '#626972',             bg = '#1a1e23' })
  hi('TelescopePromptNormal',   { fg = '#f2f2f3',          bg = '#1a1e23' })
  hi('TelescopePromptBorder',   { fg = '#626972',             bg = '#1a1e23' })
  hi('TelescopePromptPrefix',   { fg = '#becbdc',             bg = '#1a1e23' })
  hi('TelescopePromptCounter',  { fg = '#afb2b6',  bg = '#1a1e23' })
  hi('TelescopePromptTitle',    { fg = '#1a1e23',             bg = '#becbdc' })
  hi('TelescopePreviewTitle',   { fg = '#1a1e23',             bg = '#c1bfdb' })
  hi('TelescopeResultsTitle',   { fg = '#1a1e23',             bg = '#cfbfdb' })
  hi('TelescopeSelection',      { fg = '#f2f2f3',          bg = '#262d36' })
  hi('TelescopeSelectionCaret', { fg = '#becbdc',             bg = '#262d36' })
  hi('TelescopeMatching',       { fg = '#becbdc',             bold = true })
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
