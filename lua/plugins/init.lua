-- Автоматическая установка Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Настройка и загрузка плагинов
require("lazy").setup({
  -- Цветовая схема
  { 
    "folke/tokyonight.nvim", 
    lazy = false,
    priority = 1000,
    opts = {},
  },
  
  -- Иконки
  { "nvim-tree/nvim-web-devicons" },


  -- Файловый менеджер
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
          sort_by = "name",
          view = {
            width = 30,
            side = "left",
            adaptive_size = true,
          },
          renderer = {
            highlight_git = true,
            icons = {
              show = {
                git = true,
                folder = true,
                file = true,
              },
            },
          },
          diagnostics = {
            enable = true,
            show_on_dirs = true,
          },
          update_focused_file = {
            enable = true,
            update_cwd = true,
          },
          git = {
            enable = true,
            ignore = false,
          },
        })
    end
  },
  
  -- Статусная строка
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end
  },
  
  -- Автодополнение
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    }
  },
  
  -- Сниппеты
  "L3MON4D3/LuaSnip",
  
  -- LSP
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function setup(server, opts)
        opts = opts or {}
        opts.capabilities = capabilities
        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
      end

      setup("lua_ls", {
        settings = {
          Lua = { diagnostics = { globals = { "vim" } } }
        }
      })

      setup("rust_analyzer", {
        settings = {
          semanticHighlighting = {
            punctuation = {
              enable = true,
            },
            operator = {
              enable = true,
            },
          },
          checkOnSave = {
            command = "clippy",
            allFeatures = true,
          },
          completion = {
            postfix = {
              enable = false,
            },
            autoimport = {
              enable = true,
            },
          },
          imports = {
            granularity = {
              group = "module",
            },
            prefix = "self",
          },
          assist = {
            importGranularity = "module",
            importPrefix = "by_self",
          },
          hover = {
            actions = {
              references = {
                enable = true,
              },
            },
          },
          cargo = {
            loadOutDirsFromCheck = true,
            allFeatures = true,
          },
          procMacro = {
            enable = true,
          },
        }
      })

      setup("pyright")
      setup("html")
      setup("ts_ls")
      setup("gopls")
      setup("bashls")
      setup("dockerls")
      setup("yamlls")
      setup("jsonls")
    end
  },
  
  {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",   -- огромная база сниппетов
    "onsails/lspkind.nvim",
  },

  -- Treesitter (подсветка синтаксиса)
  {
    "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Ваши языки
      ensure_installed = { 
        "lua",        -- Lua
        "python",     -- Python
        "javascript", -- JavaScript
        "typescript", -- TypeScript
        "go",         -- Go (бывший golang)
        "rust",       -- Rust
        "cpp",        -- C++
        "c",          -- C
      },
      
      -- Автоматически устанавливать отсутствующие парсеры
      auto_install = true,
      
      -- Подсветка синтаксиса
      highlight = { 
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      
      -- Автоотступы
      indent = { enable = true },
      
      -- Инкрементальный выбор
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })
  end
  },

  -- Добавьте этот плагин в lazy.nvim:
    {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
        require("mason").setup()
    end
    },
    {
    "williamboman/mason-lspconfig.nvim",
    config = function()
        require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",          -- Lua
            "pyright",         -- Python
            "ts_ls",        -- TypeScript/JavaScript
            "gopls",           -- Go
            "rust_analyzer",   -- Rust
            "clangd",          -- C/C++
        }
        })
    end
    },
  
  -- Telescope (поиск файлов)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  {
    'nvim-telescope/telescope-project.nvim',
    dependencies = { "nvim-telescope/telescope.nvim" }
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup{
        size = 15,
        open_mapping = [[<C-j>]],
        shade_terminals = true,
        direction = 'horizontal',
        float_opts = {
          border = 'rounded'
        }
      }
    end
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      position = "bottom",     -- можно "bottom", "top", "left", "right"
      height = 10,
      mode = "workspace_diagnostics",  -- или "document_diagnostics"
      auto_open = false,
      auto_close = true,
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "",
      },
      use_diagnostic_signs = true,
    },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
      { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document diagnostics" },
      { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location list" },
      { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix" },
    },
  },

  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Самая простая и надёжная функция — возвращает просто строку с иконкой
      local function ic(symbol, text)
        return symbol .. " " .. text
      end

      dashboard.section.buttons.val = {
        dashboard.button("f", ic("", "Find file"),       ":Telescope find_files<CR>"),
        dashboard.button("n", ic("", "New file"),        ":ene <BAR> startinsert <CR>"),
        dashboard.button("p", ic("", "Projects"),        ":Telescope projects<CR>"),
        dashboard.button("r", ic("", "Recent files"),    ":Telescope oldfiles<CR>"),
        dashboard.button("s", ic("", "Settings / Plugins"), ":Lazy<CR>"),
        dashboard.button("u", ic("", "Update plugins"),  ":Lazy sync<CR>"),
        dashboard.button("q", ic("⏻", "Quit"),            ":qa<CR>"),
      }

      -- Любой красивый заголовок (можно оставить свой)
      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
        "                                                     ",
      }

      alpha.setup(dashboard.config)
    end,
  },
})