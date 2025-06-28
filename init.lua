local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- Lazy autoinstall
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("config.config")		      -- Config
require("config.keymaps")		      -- Keymaps
local ok, err = pcall(require, "config.lazy") -- Lazy
if not ok then
  print("Error loading lazy config:", vim.inspect(err))
end
