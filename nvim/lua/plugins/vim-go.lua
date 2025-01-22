return {
  "fatih/vim-go",
  ft = "go",
  config = function()
    require("which-key").add({
      { ",", group = "+Code" },
      { ",s", ":GoAlternate<cr>", desc = "Switch to Alternate" },
      { ",b", ":w<bar>GoBuild<cr>", desc = "[b]uild" },
      { ",r", ":GoRun<cr>", desc = "[r]un" },

      { ",c", group = "+Coverage" },
      { ",cc", ":GoCoverageToggle<cr>", desc = "[c]overage toggle" },
      { ",cb", ":GoCoverageBrowser<cr>", desc = "[b]rowse coverage" },

      { ",t", group = "+Test" },
      { ",tt", ":w<bar>:GoTest<cr>", desc = "[t]est all" },
      { ",tf", ":w<bar>:GoTestFunc<cr>", desc = "this [f]unction" },
      { ",ti", ":w<bar>:GoTestFile<cr>", desc = "this f[i]le" },
      { ",tc", ":w<bar>:GoTestCompile<cr>", desc = "test [c]ompile" },
      { ",tm", ":w<bar>:GoMetaLinter<cr>", desc = "[m]etalinter" },

      { ",x", group = "+Docs" },
      { ",xi", ":GoDoc<cr>", desc = "[i]nline docs" },
      { ",xb", ":GoDocBrowser<cr>", desc = "[b]rowser docs" },

    })
  end,
}

