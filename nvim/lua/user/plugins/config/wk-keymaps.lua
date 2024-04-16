local wk = require('which-key')
wk.register({
  ["<leader>"] = {
    ["<leader>"] = { "<cmd>Telescope frecency workspace=CWD<cr>", "Frecency file history" },
    b = {
      function()
        require('telescope.builtin').buffers()
      end,
      "All buffers"
    },
    {
      c = {
        name = "+copy",
        r = { '<cmd>let @+ = expand("%:f")<CR>', 'Copy relative path' },
        a = { '<cmd>let @+ = expand("%:p")<CR>', 'Copy absolute path' },
        f = { '<cmd>let @+ = expand("%:t")<CR><CR>', 'Copy file name' },
      }
    },
    d = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'Run diagnostics' },
    f = {
      name = "+see more options",
      f = {
        function()
          require('telescope.builtin').find_files()
        end,
        "Files"
      },
      r = { "<cmd>Format<cr>", "Format file" },
    },
    F = {
      function()
        require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All Files' })
      end,
      "All files"
    },
    g = {
      function()
        require('telescope').extensions.live_grep_args.live_grep_args()
      end,
      "Live search"
    },
    h = {
      function()
        require('telescope.builtin').oldfiles()
      end,
      "Show history"
    },
    k = { ":nohlsearch<CR>", "Quickly clear search highlighting" },
    q = { ":Bdelete<CR>", "Close current buffer" },
    Q = { ":bufdo bdelete<CR>", "Close all open buffers" },
    s = {
      function()
        require('telescope.builtin').lsp_document_symbols()
      end,
      "Symbols"
    },
    t = {
      name = "+telescope commands",
      g = {
        name = "+git commands",
        { b = { "<cmd>Telescope git_branches<cr>", "Git branches" } },
        { c = { "<cmd>Telescope git_commits<cr>", "Git commits" } },
        { f = { "<cmd>Telescope git_files<cr>", "Git files" } },
        { s = { "<cmd>Telescope git_status<cr>", "Git status" } },
        { bc = { "<cmd>Telescope git_bcommits<cr>", "Git branch commits" } },
      },
      t = { "<cmd>Telescope builtin<cr>", "Telescope builtins" },
    },
    x = { ":!xdg-open %<cr><cr>", "Open current file in the default program" },
    lr = { ':LspRestart<CR>', 'Restart LSP server' },
    rn = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename variable or function or parameter' },
    vs = { '<cmd>vsp<CR>', 'Open vertical split' },
    n = { '<cmd>Neotree reveal toggle<CR>', 'Open File explorer' },
  },
})
