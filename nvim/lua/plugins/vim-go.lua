return {
  "fatih/vim-go",
  config = function()
    require("which-key").register({
      [","] = { name = "+code" },
      [",s"] = { ":GoAlternate<cr>", "[s]witch to alternate" },
      [",b"] = { ":GoBuild<cr>", "[b]uild" },
      [",r"] = { ":GoRun<cr>", "[r]un" },

      [",c"] = { name = "+coverage" },
      [",cc"] = { ":GoCoverageToggle<cr>", "[c]overage toggle" },
      [",cb"] = { ":GoCoverageBrowser<cr>", "[b]rowse coverage" },

      [",t"] = { name = "+test" },
      [",tt"] = { ":GoTest<cr>", "[t]est all" },
      [",tf"] = { ":GoTestFunc<cr>", "this [f]unction" },
      [",ti"] = { ":GoTestFile<cr>", "this f[i]le" },
      [",tc"] = { ":GoTestCompile<cr>", "test [c]ompile" },
      [",tm"] = { ":GoMetaLinter<cr>", "[m]etalinter" },

      [",d"] = { name = "+docs" },
      [",di"] = { ":GoDoc<cr>", "[d]ocs [i]nline" },
      [",db"] = { ":GoDocBrowser<cr>", "[d]ocs in [b]rowser" },

    })
  end,
      ft = "go",
}

