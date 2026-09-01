return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",

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
    "olimorris/codecompanion.nvim",
    version = "19.23.0",
    lazy = false,

    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
      },
    },

    opts = {
      -- Use somente o nome do adaptador aqui.
      -- Não coloque model = "auto" nesta versão.
      interactions = {
        chat = {
          adapter = "copilot",

          opts = {
            system_prompt = function(ctx)
              return ctx.default_system_prompt
                .. "\n\nVocê é um assistente de programação que responde em português."
            end,
          },
        },

        inline = {
          adapter = "copilot",
        },

        cmd = {
          adapter = "copilot",
        },
      },

      -- Define um modelo conhecido dentro do adaptador copilot.
      adapters = {
        http = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "gpt-4.1",
                },
              },
            })
          end,

          opts = {
            show_model_choices = false,
          },
        },
      },

      opts = {
        log_level = "ERROR",
      },
    },

    keys = {
      {
        "<leader>ac",
        "<cmd>CodeCompanionChat Toggle<cr>",
        mode = { "n", "v" },
        desc = "Alternar chat do Copilot",
      },
      {
        "<leader>ai",
        "<cmd>CodeCompanion<cr>",
        mode = { "n", "v" },
        desc = "Copilot inline",
      },
      {
        "<leader>aa",
        "<cmd>CodeCompanionActions<cr>",
        mode = { "n", "v" },
        desc = "Ações do Copilot",
      },
      {
        "<leader>ae",
        "<cmd>CodeCompanion /explain<cr>",
        mode = "v",
        desc = "Explicar seleção",
      },
      {
        "<leader>af",
        "<cmd>CodeCompanion /fix<cr>",
        mode = "v",
        desc = "Corrigir seleção",
      },
      {
        "<leader>at",
        "<cmd>CodeCompanion /tests<cr>",
        mode = "v",
        desc = "Gerar testes",
      },
    },
  },
}
