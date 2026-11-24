return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",

    keys = {
      {
        "<leader>cp",
        function()
          require("copilot.suggestion").toggle_auto_trigger()
          local on = vim.b.copilot_suggestion_auto_trigger ~= false
          vim.notify("Copilot ghost: " .. (on and "ON" or "OFF"))
        end,
        desc = "Alternar sugestões ghost do Copilot",
      },
      {
        "<leader>icm",
        function()
          vim.g.copilot_cmp_menu = not vim.g.copilot_cmp_menu
          vim.notify("Copilot no menu: " .. (vim.g.copilot_cmp_menu and "ON" or "OFF"))
        end,
        desc = "Alternar Copilot no menu de sugestões",
      },
      {
        "<M-p>",
        function()
          local suggestion = require("copilot.suggestion")
          -- Se estiver desligado, religa (isso já dispara uma nova sugestão).
          if vim.b.copilot_suggestion_auto_trigger == false then
            suggestion.toggle_auto_trigger()
          else
            -- Sugestão visível: cicla; sem sugestão: pede a next.
            suggestion.next()
          end
        end,
        mode = "i",
        desc = "Copilot: ativar/renovar sugestão ghost",
      },
    },

    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,

          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },

        panel = {
          enabled = false,
        },

        copilot_node_command = "node",
      })
    end,
  },

  {
    "nickjvandyke/opencode.nvim",
    -- "main" suporta OpenCode v2
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {}

      vim.keymap.set({ "n", "x" }, "<leader>oa", function()
        require("opencode").ask("@this: ")
      end, { desc = "Perguntar ao OpenCode" })

      vim.keymap.set({ "n", "x" }, "<leader>os", function()
        require("opencode").select()
      end, { desc = "Selecionar ação do OpenCode" })

      vim.keymap.set({ "n", "x" }, "<leader>or", function()
        return require("opencode").operator("@this")
      end, { expr = true, desc = "Enviar seleção/linha ao OpenCode" })

      vim.keymap.set({ "n" }, "<leader>oc", function()
        require("opencode").command()
      end, { desc = "Executar comando do OpenCode" })
    end,
  },
}
