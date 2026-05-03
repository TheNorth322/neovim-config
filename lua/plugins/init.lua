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

  {
    "y3owk1n/undo-glow.nvim",
    event = { "VeryLazy" },
    opts = {
      animation = {
        enabled = true,
        duration = 300,
        animation_type = "zoom",
        window_scoped = true,
      },
      highlights = {
        undo = {
          hl_color = { bg = "#693232" }, -- Dark muted red
        },
        redo = {
          hl_color = { bg = "#2F4640" }, -- Dark muted green
        },
        yank = {
          hl_color = { bg = "#7A683A" }, -- Dark muted yellow
        },
        paste = {
          hl_color = { bg = "#325B5B" }, -- Dark muted cyan
        },
        search = {
          hl_color = { bg = "#5C475C" }, -- Dark muted purple
        },
        comment = {
          hl_color = { bg = "#7A5A3D" }, -- Dark muted orange
        },
        cursor = {
          hl_color = { bg = "#793D54" }, -- Dark muted pink
        },
      },
      priority = 2048 * 3,
    },
    keys = {
      {
        "u",
        function()
          require("undo-glow").undo()
        end,
        mode = "n",
        desc = "Undo with highlight",
        noremap = true,
      },
      {
        "U",
        function()
          require("undo-glow").redo()
        end,
        mode = "n",
        desc = "Redo with highlight",
        noremap = true,
      },
      {
        "p",
        function()
          require("undo-glow").paste_below()
        end,
        mode = "n",
        desc = "Paste below with highlight",
        noremap = true,
      },
      {
        "P",
        function()
          require("undo-glow").paste_above()
        end,
        mode = "n",
        desc = "Paste above with highlight",
        noremap = true,
      },
      {
        "n",
        function()
          require("undo-glow").search_next({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search next with highlight",
        noremap = true,
      },
      {
        "N",
        function()
          require("undo-glow").search_prev({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search prev with highlight",
        noremap = true,
      },
      {
        "*",
        function()
          require("undo-glow").search_star({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search star with highlight",
        noremap = true,
      },
      {
        "#",
        function()
          require("undo-glow").search_hash({
            animation = {
              animation_type = "strobe",
            },
          })
        end,
        mode = "n",
        desc = "Search hash with highlight",
        noremap = true,
      },
      {
        "gc",
        function()
          -- This is an implementation to preserve the cursor position
          local pos = vim.fn.getpos(".")
          vim.schedule(function()
            vim.fn.setpos(".", pos)
          end)
          return require("undo-glow").comment()
        end,
        mode = { "n", "x" },
        desc = "Toggle comment with highlight",
        expr = true,
        noremap = true,
      },
      {
        "gc",
        function()
          require("undo-glow").comment_textobject()
        end,
        mode = "o",
        desc = "Comment textobject with highlight",
        noremap = true,
      },
      {
        "gcc",
        function()
          return require("undo-glow").comment_line()
        end,
        mode = "n",
        desc = "Toggle comment line with highlight",
        expr = true,
        noremap = true,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) text",
        callback = function()
          require("undo-glow").yank()
        end,
      })

      -- This only handles neovim instance and do not highlight when switching panes in tmux
      vim.api.nvim_create_autocmd("CursorMoved", {
        desc = "Highlight when cursor moved significantly",
        callback = function()
          require("undo-glow").cursor_moved({
            animation = {
              animation_type = "slide",
            },
          })
        end,
      })

      -- This will handle highlights when focus gained, including switching panes in tmux
      vim.api.nvim_create_autocmd("FocusGained", {
        desc = "Highlight when focus gained",
        callback = function()
          ---@type UndoGlow.CommandOpts
          local opts = {
            animation = {
              animation_type = "slide",
            },
          }

          opts = require("undo-glow.utils").merge_command_opts("UgCursor", opts)
          local pos = require("undo-glow.utils").get_current_cursor_row()

          require("undo-glow").highlight_region(vim.tbl_extend("force", opts, {
            s_row = pos.s_row,
            s_col = pos.s_col,
            e_row = pos.e_row,
            e_col = pos.e_col,
            force_edge = opts.force_edge == nil and true or opts.force_edge,
          }))
        end,
      })

      vim.api.nvim_create_autocmd("CmdlineLeave", {
        desc = "Highlight when search cmdline leave",
        callback = function()
          require("undo-glow").search_cmd({
            animation = {
              animation_type = "fade",
            },
          })
        end,
      })
    end,
  },
}
