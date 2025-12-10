-- Основные настройки Neovim
vim.opt.number = true          -- Номера строк
vim.opt.relativenumber = true  -- Относительные номера строк
vim.opt.tabstop = 4           -- Размер табуляции
vim.opt.shiftwidth = 4        -- Размер отступа
vim.opt.expandtab = true      -- Замена табов на пробелы
vim.opt.smartindent = true    -- Умные отступы
vim.opt.wrap = false          -- Не переносить строки
vim.opt.swapfile = false      -- Не создавать swap-файлы
vim.opt.backup = false        -- Не создавать бэкапы
vim.opt.hlsearch = true       -- Подсветка поиска
vim.opt.incsearch = true      -- Инкрементальный поиск
vim.opt.termguicolors = true  -- True color поддержка
vim.opt.scrolloff = 8         -- Отступ при скроллинге
vim.opt.updatetime = 50       -- Частота обновления
vim.opt.colorcolumn = "80"    -- Вертикальная линия на 80 символов
vim.opt.mouse = "a"           -- Включить мышь
vim.opt.clipboard = "unnamedplus"  -- Использовать системный буфер обмена