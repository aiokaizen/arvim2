local plugins = {
  {
    "nvimtools/none-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    'anuvyklack/pretty-fold.nvim',
    event = "BufWinEnter", -- Load on entering a buffer
    config = function()
      require('pretty-fold').setup()
    end
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua", "vim", "vimdoc", "toml", "yaml",
        "python", "javascript", "scss", "rust",
        "html", "css", "rst", "json", "dockerfile"
      }
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufWinEnter", -- Load on entering a buffer
    config = function(_, opts)
      require('treesitter-context').setup({
        enable = true,
        multiline_threshold = 1,
        max_lines = 5,
      })
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, conf)
      conf.defaults.mappings.i = {
        ["<C-k>"] = require("telescope.actions").move_selection_previous, -- move to prev result
        ["<C-j>"] = require("telescope.actions").move_selection_next,     -- move to next result
      }
      return conf
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function(_, opts)
      opts.filters.custom = {
        "^node_modules$",
        "^%.git$",
        -- "^%.*~$",
        "__pycache__",
        "%.mypy_cache",
        "%.ruff_cache",
        "%.null%-ls.*",
      }
      return opts
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "BufWinEnter", -- Load on entering a buffer
    config = function()
      require "configs.neoscroll"
    end
  },
  {
    "folke/zen-mode.nvim",
    event = "BufWinEnter", -- Load on entering a buffer
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup()
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
  {
    'anuvyklack/pretty-fold.nvim',
    event = "BufWinEnter", -- Load on entering a buffer
    config = function()
      require('pretty-fold').setup()
    end
  },
  -- {
  --   'RRethy/vim-illuminate',
  --   config = function()
  --     require('illuminate').configure({
  --       providers = {
  --         'lsp',
  --         'treesitter',
  --         'regex',
  --       },
  --       -- You can add more configuration options here if needed
  --     })
  --   end,
  -- }
}
return plugins
