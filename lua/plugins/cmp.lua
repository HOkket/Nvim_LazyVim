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
      },
      keymap = {
        -- Define Ctrl + d para abrir/fechar a documentação manualmente
        ["<C-d>"] = { "show_documentation", "hide_documentation", "fallback" },
      },
    },
  },
}
