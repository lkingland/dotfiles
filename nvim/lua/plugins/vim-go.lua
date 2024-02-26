return {
  "fatih/vim-go",
  config = function()
    require("which-key").register({
      [","] = { name = "+code" },
      [",s"] = { ":GoAlternate<cr>", "[s]witch to alternate" },
      [",b"] = { ":w<bar>GoBuild<cr>", "[b]uild" },
      [",r"] = { ":GoRun<cr>", "[r]un" },

      [",c"] = { name = "+coverage" },
      [",cc"] = { ":GoCoverageToggle<cr>", "[c]overage toggle" },
      [",cb"] = { ":GoCoverageBrowser<cr>", "[b]rowse coverage" },

      [",t"] = { name = "+test" },
      [",tt"] = { ":w<bar>:GoTest<cr>", "[t]est all" },
      [",tf"] = { ":w<bar>:GoTestFunc<cr>", "this [f]unction" },
      [",ti"] = { ":w<bar>:GoTestFile<cr>", "this f[i]le" },
      [",tc"] = { ":w<bar>:GoTestCompile<cr>", "test [c]ompile" },
      [",tm"] = { ":w<bar>:GoMetaLinter<cr>", "[m]etalinter" },

      [",x"] = { name = "+docs" },
      [",xi"] = { ":GoDoc<cr>", "[i]nline docs" },
      [",xb"] = { ":GoDocBrowser<cr>", "[b]rowser docs" },

    })
  end,
      ft = "go",
}

