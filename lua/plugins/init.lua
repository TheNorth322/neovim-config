return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "ntpeters/vim-better-whitespace",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_on_save = 0
      vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "#BF2A3A" })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    import = "nvchad.blink.lazyspec"
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"lua", "vimdoc",
            "c", "cpp", "python",
            "cmake", "xml"
  		},
  	},
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 500,
      },
    },
  },

  {
    "sphamba/smear-cursor.nvim",
    lazy = false,
    opts = {
        smear_between_buffers = false,
    },
  },

  {
    "mluders/comfy-line-numbers.nvim",
    lazy = false,
    opts = {
        labels = {
            '1', '2', '3', '4', '5', '11', '12', '13', '14', '15', '21', '22', '23',
            '24', '25', '31', '32', '33', '34', '35', '41', '42', '43', '44', '45',
            '51', '52', '53', '54', '55', '111', '112', '113', '114', '115', '121',
            '122', '123', '124', '125', '131', '132', '133', '134', '135', '141',
            '142', '143', '144', '145', '151', '152', '153', '154', '155', '211',
            '212', '213', '214', '215', '221', '222', '223', '224', '225', '231',
            '232', '233', '234', '235', '241', '242', '243', '244', '245', '251',
            '252', '253', '254', '255',
          },

          up_key = '<Up>',
          down_key = '<Down>',

          hidden_file_types = { 'undotree' },
          hidden_buffer_types = { 'terminal', 'nofile' }
    }
  },

}
