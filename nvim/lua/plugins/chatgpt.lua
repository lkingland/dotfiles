return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = { 
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  config = function()

    vim.api.nvim_set_hl(0, 'ChatGPTBorder', { fg = '#666666', bg = 'black' })

    require("chatgpt").setup({
      api_key_cmd = "chatgpt-session.sh", -- $bw unlock --raw > ~/.bw-session
      popup_window = {
        border = {
          highlight = "ChatGPTBorder",
          text = {
            top = "",
          },
        },
        win_options = {
          winhighlight = "Normal:ChatGPTBorder,FloatBorder:ChatGPTBorder",
        },
      },
      system_window = {
        win_options = {
          winhighlight = "Normal:ChatGPTBorder,FloatBorder:ChatGPTBorder",
        },
      },
      popup_input = {
        prompt = "",
        border = {
          highlight = "ChatGPTBorder",
          text = {
            top = "",
          },
        },
        win_options = {
          winhighlight = "Normal:ChatGPTBorder,FloatBorder:ChatGPTBorder",
        },
      },
      settings_window = {
        win_options = {
          winhighlight = "Normal:Normal,ChatGPTBorder:FloatBorder",
        },
      },
      help_window = {
        win_options = {
          winhighlight = "Normal:Normal,ChatGPTBorder:FloatBorder",
        },
      },
      openai_params = {
        model = "gpt-4o",
        -- frequency_penalty = 0,
        -- presence_penalty = 0,
        max_tokens = 4096,
        -- temperature = 0,
        -- top_p = 1,
        -- n = 1,
      },
      openai_edit_params = {
        model = "gpt-4o",
        -- frequency_penalty = 0,
        -- presence_penalty = 0,
        -- temperature = 0,
        -- top_p = 1,
        -- n = 1,
      },
    })
  end,
}

