-- Suporte a Bash/Shell: LSP, lint (shellcheck), formatação (shfmt) e highlight (treesitter)
return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "bash-language-server", "shellcheck", "shfmt" } },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "bash" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        sh = { "shellcheck" },
        bash = { "shellcheck" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
    },
  },
}
