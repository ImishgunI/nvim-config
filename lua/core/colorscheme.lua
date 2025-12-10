-- Безопасная загрузка colorscheme
local function set_colorscheme(name)
  local ok, _ = pcall(vim.cmd, "colorscheme " .. name)
  if not ok then
    vim.notify("Colorscheme not found: " .. name, vim.log.levels.WARN)
  end
end

-- ✅ ПО УМОЛЧАНИЮ (встроенная)
set_colorscheme("tokyonight")

-- 🔁 ЕСЛИ захочешь плагиновую — просто поменяй строку:
-- set_colorscheme("catppuccin")
-- set_colorscheme("tokyonight")
