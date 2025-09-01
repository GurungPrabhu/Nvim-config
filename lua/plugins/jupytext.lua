return {
  "GCBallesteros/jupytext.nvim",
  config = function()
    require("jupytext").setup {
      auto_sync = true,
      fallback_kernelspec = {
        name = "python3",
        display_name = "Python 3",
      },
    }
  end,
}
