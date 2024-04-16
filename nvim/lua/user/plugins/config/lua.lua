require'lspconfig'.lua_ls.setup{
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      }
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = {
        'vim',
        'require'
      },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
      -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
  }
}
