return {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    dependencies = { 
      -- { 'zbirenbaum/copilot-cmp', opts = {} },
    },
    config = function()
      require("copilot").setup({})
      -- require("copilot").setup({
      --   suggestion = { enabled = false },
      --   panel = { enabled = false },
      -- })

      -- require("which-key").register({
      --   [";"] = { name = "bot" },
      --   [";c"] = { ":ChatGPT<cr>", "[c]hat", mode = { "n", "v" } },
      --   [";a"] = { ":ChatGPTActAs<cr>", "[a]ct as...", mode = { "n", "v" } },
      --   [";e"] = { ":ChatGPTEditWithInstructions<cr>", "[e]dit", mode = { "n", "v" } },
      --   [";r"] = { ":ChatGPTRun<cr>", "[r]un", mode = { "n", "v" } },
      -- })

    end,
}
