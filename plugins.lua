local overrides=require("custom.configs.overrides")
local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config =function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
     require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
     local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
     require("dap-python").setup(path)
     require("core.utils").load_mappings("dap_python")
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "eslint-lsp",
        "typescript-language-server"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
     config = function()
        require("plugins.configs.lspconfig")
        require("custom.configs.lspconfig")
     end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft ={"python"},
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },
    {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
 {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
    --  config = function()
    --   vim.g.wakatime_api_key = vim.fn.system("pass show wakatime/api")
    -- end
  },
  -- {
  --   "vim-crystal/vim-crystal"
  --   -- ft="crystal"
  --   event = "VeryLazy",
  --   -- lazy = false,
  --   config = function()
  --     -- vim.g.crystal_auto_format = 1
  --     vim.g.crystal_auto_format = 1
  --   end,
  -- },
  {
    'jinzaizhichi/ChatGPT.nvim',
    -- event = "VeryLazy",
    event = "BufRead",
    config = function()
      require("chatgpt").setup({
      -- async_api_key_cmd = "pass show 2dapi/token", 
      api_key_cmd = "pass show 2dapi/token",
      api_host_cmd = "pass show openai/host",
      -- OPENAI_API_HOST= "pass show openai/host",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
  },
  {
    'alker0/chezmoi.vim',
    event = "VeryLazy",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy=false,
  },
    {
        "JuanZoran/Trans.nvim",
        build = function () require'Trans'.install() end,
        keys = {
        -- 可以换成其他你想映射的键
            { 'mm', mode = { 'n', 'x' }, '<Cmd>Translate<CR>', desc = ' Translate' },
            { 'mk', mode = { 'n', 'x' }, '<Cmd>TransPlay<CR>', desc = ' Auto Play' },
            -- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
            { 'mi', '<Cmd>TranslateInput<CR>', desc = ' Translate From Input' },
        },
        dependencies = { 'kkharji/sqlite.lua', },
        opts = {
            -- your configuration there
        }
    },
  {
    'yianwillis/vimcdoc',
    event="VeryLazy"
  },
}
return plugins
