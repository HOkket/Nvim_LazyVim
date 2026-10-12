-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Abreviações de boilerplate por filetype (expandem com espaço depois da palavra)
local function abbrevs(ft, map)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = ft,
    callback = function()
      for trigger, repl in pairs(map) do
        vim.cmd(("iabbrev <buffer> %s %s"):format(trigger, repl))
      end
    end,
  })
end

abbrevs("python", {
  ifmain = 'if __name__ == "__main__":',
  bp = "breakpoint()",
  pp = "pprint.pprint()",
})

abbrevs({ "sh", "bash" }, {
  shebang = "#!/usr/bin/env bash",
  strict = "set -euo pipefail",
})
