-- django htmx templates
vim.filetype.add({
  pattern = {
    [".*/templates/.*%.html"] = "htmldjango",
  },
})

-- Go templates
vim.filetype.add({
  extension = {
    tmpl = "gotmpl",
  },
})
