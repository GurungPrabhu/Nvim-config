-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.code-runner.molten-nvim" },
  { import = "astrocommunity.pack.quarto" },
  { import = "astrocommunity.completion.copilot-vim-cmp" },
  -- import/override with your plugins folder
}
