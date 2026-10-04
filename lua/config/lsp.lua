-- Completion capabilities must be defined first.
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- Apply Blink capabilities to every LSP configuration.
vim.lsp.config("*", {
  capabilities = capabilities,
})


-- LaTEX

vim.lsp.config("texlab", {
  settings = {
    texlab = {
      build = {
        onSave = false,
      },
    },
  },
})

vim.lsp.enable("texlab")

-- Python
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


-- Go
vim.lsp.config("gopls", {
  cmd = { "gopls" },

  filetypes = {
    "go",
    "gomod",
    "gowork",
    "gotmpl",
  },

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

-- C / C++
vim.lsp.config("clangd", {
  cmd = { "clangd" },

  filetypes = {
    "c",
    "cpp",
    "objc",
    "objcpp",
    "cuda",
  },

  root_markers = {
    "compile_commands.json",
    "compile_flags.txt",
    ".clangd",
    ".git",
  },
})

-- JSON
vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },

  filetypes = {
    "json",
    "jsonc",
  },

  root_markers = {
    "package.json",
    ".git",
  },

  settings = {
    json = {
      validate = {
        enable = true,
      },

      schemas = {
        {
          fileMatch = { "package.json" },
          url = "https://json.schemastore.org/package.json",
        },
        {
          fileMatch = { "tsconfig.json", "tsconfig.*.json" },
          url = "https://json.schemastore.org/tsconfig.json",
        },
      },
    },
  },
})


-- Django
vim.lsp.config("djls", {
  cmd = { "djls", "serve" },
  filetypes = { "python", "htmldjango" },
  root_markers = { "manage.py", ".git" },
})



-- Enable the servers configured above.
vim.lsp.enable({
  "pyright",
  "gopls",
  "clangd",
  "jsonls",
  "lua_ls",
  "djls",
})

-- LSP keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("user-lsp-attach", {
    clear = true,
  }),

  callback = function(ev)
    local opts = {
      buffer = ev.buf,
      silent = true,
    }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gk", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gl", function()
      vim.diagnostic.open_float(nil, {
        scope = "cursor",
        border = "rounded",
        max_width = 80,
        focusable = false,
      })
    end)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({
        async = true,
      })
    end, opts)
  end,
})

-- Diagnostics
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    spacing = 4,
  },
  
  signs = false,
  underline = true,
  severity_sort = true,
})
