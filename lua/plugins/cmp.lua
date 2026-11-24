return {
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        documentation = {
          -- Desativa a abertura automática ao digitar
          auto_show = false,
          -- Se preferir automático mas com atraso (ex: 1 segundo), descomente abaixo:
          -- auto_show = true,
          -- auto_show_delay_ms = 1000,
        },
        list = {
          selection = {
            -- Não seleciona o primeiro item automaticamente.
            -- Assim, Enter apenas quebra linha se você não escolheu um item.
            preselect = false,
          },
        },
      },
      keymap = {
        -- Define Ctrl + d para abrir/fechar a documentação manualmente
        ["<C-a>"] = { "show_documentation", "hide_documentation", "fallback" },
      },
      sources = {
        -- Mantém os providers padrão + os dos extras (ex.: dadbod) e adiciona o Copilot.
        default = { "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
            -- Ligado/desligado em runtime por <leader>icm
            enabled = function()
              return vim.g.copilot_cmp_menu == true
            end,
          },
        },
      },
    },
  },
  {
    -- Necessário para o provider acima funcionar quando ativado.
    "fang2hou/blink-copilot",
  },
}
