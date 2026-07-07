vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
})
vim.lsp.enable("pyright")

vim.filetype.add({
  extension = {
    tmpl = "gotmpl",
  },
})
vim.lsp.config("gopls", {
  cmd = { "gopls", "-logfile=/tmp/gopls.log", "-rpc.trace" },

  filetypes = { "go", "gomod", "gowork", "gotmpl" },

  root_markers = {
    "go.work",
    "go.mod",
    ".git",
  },

  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})
vim.lsp.enable("gopls")

vim.lsp.config("clangd", {
  cmd = { "clangd" }, -- change to clangd-19/20 if that is what you installed

  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },

  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    ".clangd",
    ".git",
  },

  capabilities = vim.lsp.protocol.make_client_capabilities(),

  settings = {},
})
vim.lsp.enable("clangd")

vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  
  filetypes = { "json", "jsonc" },

  settings = {
    json = {
      validate = { enable = true },

      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
      },
    },
  },
})

vim.lsp.enable("jsonls")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, opts)
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 4,
  },
  signs = false,
  underline = true,
  severity_sort = true,
})
