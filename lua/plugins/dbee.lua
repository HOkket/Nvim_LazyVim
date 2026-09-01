return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    -- Requer curl, wget ou go para instalar o binário auxiliar
    require("dbee").install("curl")
  end,
  config = function()
    require("dbee").setup()
  end,
}
