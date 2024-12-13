local function setup_lsp_kbd()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("self-lsp-attach", { clear = true }),
    callback = function(event)
      local map = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
      end

      map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
      map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      map("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
      map("<leader>gD", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
      map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
      -- Fuzzy find all the symbols in your current workspace.
      --  Similar to document symbols, except searches over your entire project.
      map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
      map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

      map("gh", vim.diagnostic.open_float, "[O]pen float")
      map("K", vim.lsp.buf.hover, "Hover")
      -- Execute a code action, usually your cursor needs to be on top of an error
      -- or a suggestion from your LSP for this to activate.
      map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

      -- WARN: This is not Goto Definition, this is Goto Declaration.
      --  For example, in C this would take you to the header.
      map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

      local function save_and_format()
        vim.cmd("w")
        vim.lsp.buf.format()
      end

      map("<leader>ss", save_and_format, "Save and format")
    end,
  })
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    setup_lsp_kbd()

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local servers = {
      -- clangd = {},
      -- gopls = {},
      -- pyright = {},
      -- rust_analyzer = {},
      -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
      -- Some languages (like typescript) have entire language plugins that can be useful:
      --    https://github.com/pmizio/typescript-tools.nvim
      lua_ls = {},
    }

    for server_name, config in pairs(servers) do
      config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
      require("lspconfig")[server_name].setup(config)
    end
  end,
}
