require("mermaid").setup({
    format = {
        shift_width = 4,           -- Indentation size (spaces)
    },
    lint = {
        enabled = true,            -- Enable diagnostics via mmdc
        command = "mmdc",           -- Path to mermaid-cli executable
    },
    preview = {
        port = 0,                  -- Server port (0 or nil for random available port)
        renderer = "mermaid.js",   -- "mermaid.js" or "beautiful-mermaid"
        theme = "default",          -- Theme name (renderer-specific)
    },
})
