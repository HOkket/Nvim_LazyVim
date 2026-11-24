 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#171210',
    base01 = '#241f1c',
    base02 = '#2e2926',
    base03 = '#9e8d85',
    base04 = '#d5c3b9',
    base05 = '#ebe0dc',
    base06 = '#ebe0dc',
    base07 = '#ebe0dc',
    base08 = '#ffb4ab',
    base09 = '#d0c88b',
    base0A = '#e0c0af',
    base0B = '#f5ba96',
    base0C = '#d0c88b',
    base0D = '#f5ba96',
    base0E = '#e0c0af',
    base0F = '#fddcca',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- telescope.nvim
  hi('TelescopeNormal',         { fg = '#ebe0dc',          bg = '#171210' })
  hi('TelescopeBorder',         { fg = '#9e8d85',             bg = '#171210' })
  hi('TelescopePromptNormal',   { fg = '#ebe0dc',          bg = '#171210' })
  hi('TelescopePromptBorder',   { fg = '#9e8d85',             bg = '#171210' })
  hi('TelescopePromptPrefix',   { fg = '#f5ba96',             bg = '#171210' })
  hi('TelescopePromptCounter',  { fg = '#d5c3b9',  bg = '#171210' })
  hi('TelescopePromptTitle',    { fg = '#171210',             bg = '#f5ba96' })
  hi('TelescopePreviewTitle',   { fg = '#171210',             bg = '#e0c0af' })
  hi('TelescopeResultsTitle',   { fg = '#171210',             bg = '#d0c88b' })
  hi('TelescopeSelection',      { fg = '#ebe0dc',          bg = '#2e2926' })
  hi('TelescopeSelectionCaret', { fg = '#f5ba96',             bg = '#2e2926' })
  hi('TelescopeMatching',       { fg = '#f5ba96',             bold = true })

  -- mini.pick
  hi('MiniPickNormal',         { fg = '#ebe0dc',          bg = '#171210' })
  hi('MiniPickBorder',         { fg = '#9e8d85',             bg = '#171210' })
  hi('MiniPickPrompt',   { fg = '#ebe0dc',          bg = '#171210' })
  hi('MiniPickPromptPrefix',   { fg = '#f5ba96',             bg = '#171210' })
  hi('MiniPickBorderText',    { fg = '#171210',             bg = '#f5ba96' })
  hi('MiniPickMatchCurrent',      { fg = '#ebe0dc',          bg = '#2e2926' })
  hi('MiniPickPromptCaret', { fg = '#f5ba96',             bg = '#2e2926' })
  hi('MiniPickMatchRanges',       { fg = '#f5ba96',             bold = true })
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
