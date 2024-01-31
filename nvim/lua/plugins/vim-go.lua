return {
  "fatih/vim-go",
  config = function()
    require("which-key").register({
      [","] = { name = "+code" },
      [",s"] = { ":GoAlternate<cr>", "[s]witch to alternate" },
      [",b"] = { ":GoBuild<cr>", "[b]uild" },
      [",r"] = { ":GoRun<cr>", "[r]un" },

      [",c"] = { name = "+coverage" },
      [",ci"] = { ":GoCoverageToggle<cr>", "[c]overage [i]nline" },
      [",cb"] = { ":GoCoverageBrowser<cr>", "[c]overage in [b]rowser" },

      [",t"] = { name = "+test" },
      [",tr"] = { ":GoTest<cr>", "[r]un" },
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

