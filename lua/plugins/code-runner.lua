return {
  "CRAG666/code_runner.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "RunCode", "RunFile", "RunProject", "RunClose" },
  keys = {
    { "<leader>rr", ":RunCode<CR>", desc = "Run Code (Automático)" },
    { "<leader>rf", ":RunFile<CR>", desc = "Run Current File" },
    { "<leader>rp", ":RunProject<CR>", desc = "Run Project" },
    { "<leader>rc", ":RunClose<CR>", desc = "Close Runner" },
  },
  opts = {
    -- Escolha como o código será exibido: "float", "tab", "split" ou "toggleterm"
    mode = "term", 
    focus = true,
    startinsert = false,
    term = {
      position = "botright",
      size = 12,
    },
    float = {
      border = "rounded",
      height = 0.8,
      width = 0.8,
    },
    -- Comandos por extensão de arquivo
    filetype = {
      python = "python3 -u",
      javascript = "node",
      go = "go run",
      rust = "cd $dir && rustc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
      c = "cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
    },
  },
}
