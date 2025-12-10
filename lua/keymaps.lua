-- Установите leader-клавишу
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Основные сочетания клавиш
local opts = { noremap = true, silent = true }

-- Сохранение
vim.keymap.set("n", "<A-w>", ":w<CR>", opts)

-- Выход
vim.keymap.set("n", "<A-q>", ":q<CR>", opts)

-- Переключение буферов
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<S-l>", ":bnext<CR>", opts)

-- Поиск файлов с Telescope
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", opts)
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", opts)

-- Открыть/закрыть дерево файлов
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Перезагрузка конфигурации
vim.keymap.set("n", "<leader>r", ":source $MYVIMRC<CR>", opts)