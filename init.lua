-- Lazy  - Plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- Lazy autoinstall
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- Hotpot - Fennel
--local hotpot_path = vim.fn.stdpath("data") .. "/lazy/hotpot.nvim"
--if not vim.loop.fs_stat(hotpot_path) then
--  vim.fn.system({
--    "git", "clone", "--filter=blob:none", "--single-branch",
--    "https://github.com/rktjmp/hotpot.nvim.git", hotpot_path
--  })
--end
--vim.opt.runtimepath:prepend(hotpot_path)

--require("hotpot")

vim.keymap.set('t', '<C-w>', '<C-\\><C-n><C-w>', { noremap = true })

require("config.config")		      -- Config
local ok, err = pcall(require, "config.lazy") -- Lazy
if not ok then
  print("Error loading lazy config:", vim.inspect(err))
end
