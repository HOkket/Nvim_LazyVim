return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
  },
  branch = "regexp",
  opts = {
    auto_refresh = true,
  },
  keys = {
    { ",v", "<cmd>VenvSelect<cr>", desc = "Selecionar Venv do Python" },
  },
}
