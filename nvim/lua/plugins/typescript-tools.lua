return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    tsserver_path = "node_modules/typescript-language-server/lib/cli.mjs"
  },
}
