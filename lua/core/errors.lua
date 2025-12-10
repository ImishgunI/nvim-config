-- Современный набор иконок
local icons = {
  Error = " ",
  Warn  = " ",
  Info  = " ",
  Hint  = " ",
}

-- Основная конфигурация diagnostics
vim.diagnostic.config({
  underline = true, -- подчеркивание ошибок
  update_in_insert = false, -- не спамить во время ввода
  severity_sort = true, -- сортировать по важности
  virtual_text = {
    prefix = "●", -- маленькая точка
    spacing = 4,
    source = "if_many",
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.Error,
      [vim.diagnostic.severity.WARN]  = icons.Warn,
      [vim.diagnostic.severity.INFO]  = icons.Info,
      [vim.diagnostic.severity.HINT]  = icons.Hint,
    },
  },
  float = {
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    focusable = true,
  },
})
