return {
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },

    opts = {
      ensure_installed = {
        "clangd",
        "basedpyright",
        "lua_ls",
      },
    },

    config = function(_, opts)
      vim.lsp.config("clangd", {
        cmd = {
          "clangd",
          "--query-driver=/usr/bin/g++,/usr/bin/gcc",
        },
      })

      require("mason-lspconfig").setup(opts)
    end,
  },
}
