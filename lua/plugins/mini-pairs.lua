return {
  {
    "nvim-mini/mini.pairs",
    config = function(_, opts)
      LazyVim.mini.pairs(opts)

      local MiniPairs = require("mini.pairs")

      -- Aspas triplas inteligentes para " e '
      local function smart(pair, neigh)
        local o = pair:sub(1, 1)
        return function()
          local line = vim.api.nvim_get_current_line()
          local col = vim.fn.col(".")
          if line:sub(col - 1, col - 1) == o and line:sub(col - 2, col - 2) == o then
            return o
          end
          return MiniPairs.closeopen(pair, neigh)
        end
      end
      _G.__doc_quote_dq = smart('""', '^[^\\]')
      _G.__doc_quote_sq = smart("''", '^[^%a\\]')
      vim.api.nvim_set_keymap("i", '"', "v:lua.__doc_quote_dq()", { expr = true, noremap = true })
      vim.api.nvim_set_keymap("i", "'", "v:lua.__doc_quote_sq()", { expr = true, noremap = true })

      -- <C-l> pula o par de fechamento
      local closers = { [')'] = true, [']'] = true, ['}'] = true, ['"'] = true, ["'"] = true, ['`'] = true }
      _G.__pairs_jump = function()
        local line = vim.api.nvim_get_current_line()
        local col = vim.fn.col(".")
        if closers[line:sub(col, col)] then
          return vim.api.nvim_replace_termcodes("<Right>", true, false, true)
        end
        return ""
      end
      vim.api.nvim_set_keymap("i", "<C-l>", "v:lua.__pairs_jump()", { expr = true, noremap = true })
    end,
  },
}
