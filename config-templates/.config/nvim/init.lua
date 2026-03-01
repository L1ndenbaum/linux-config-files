-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = ""

vim.opt.tabstop = 4      -- 一个 <Tab> 显示为 4 列宽
vim.opt.shiftwidth = 4   -- 自动缩进使用 4 列
vim.opt.softtabstop = 4  -- 插入模式下 Tab 键视为 4
vim.opt.expandtab = true -- 把 Tab 转成空格
vim.opt.autoindent = true-- 自动继承上一行缩进

-- gofmt 必须用真实tab, 关闭 expandtab 功能
vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = "go",
        callback = function()
        vim.opt_local.expandtab = false
        end,
    }
)
