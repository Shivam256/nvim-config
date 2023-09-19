local plugins = {
  {
    "vim-crystal/vim-crystal",
    ft = "crystal"
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "jdtls",
        "clangd",
        "tailwindcss-language-server",
        "typescript-language-server",
        "gopls",
      },

    },
  },
  {
    "pocco81/auto-save.nvim",
    lazy=false
  },
  {
    "rust-lang/rust.vim",
    ft="rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft="rust",
    dependencies = "neovim/nvim-lspconfig",
    opts= function ()
      return require "custom.configs.rust-tools"
    end,
    config = function (_,opts)
      require('rust-tools').setup(opts)
    end
  },
  {
    "mfussenegger/nvim-dap",

  },
  {
  "rest-nvim/rest.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
    require("rest-nvim").setup({
      -- Open request results in a horizontal split
      result_split_horizontal = false,
      -- Keep the http file buffer above|left when split horizontal|vertical
      result_split_in_place = false,
      -- Skip SSL verification, useful for unknown certificates
      skip_ssl_verification = false,
      -- Encode URL before making request
      encode_url = true,
      -- Highlight request on run
      highlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        -- toggle showing URL, HTTP info, headers at top the of result window
        show_url = true,
        -- show the generated curl command in case you want to launch
        -- the same request via the terminal (can be verbose)
        show_curl_command = false,
        show_http_info = true,
        show_headers = true,
        -- executables or functions for formatting response body [optional]
        -- set them to false if you want to disable them
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end
        },
      },
      -- Jump to request line on run
      jump_to_request = false,
      env_file = '.env',
      custom_dynamic_variables = {},
      yank_dry_run = true,
    })
  end
  },
   {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
 {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, {name = "crates"})
      return M
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy=false
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"go","javascript", "javascriptreact", "typescript", "typescriptreact", "vue","java"},
    opts = function ()
      return require "custom.configs.null-ls"
    end
  },
  {
    "rmagatti/auto-session",
    lazy=false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        -- auto_session_suppress_dirs = { "~/", "~/Desktop", "~/Downloads", "/"},
      }
    end
  },
  {
    "windwp/nvim-ts-autotag",
    lazy=false,
    ft={"html","xml","javascript", "javascriptreact", "typescript", "typescriptreact", "vue"},
    config=function ()
      require('nvim-ts-autotag').setup()
    end
  }
  -- {
  --   "mfussenegger/nvim-jdtls",
  --   ft = "java",
  --   config = function ()
  --     require "plugins.configs.lspconfig"
  --     require "custom.configs.lspconfig"
  --   end
  -- }
}

return plugins
