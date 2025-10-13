-- Ensure PATH includes npm global bin
vim.env.PATH = vim.env.HOME .. "/.npm-global/bin:" .. vim.env.PATH

require("config.options")
require("config.lazy")
require("config.keymaps")

vim.api.nvim_create_autocmd("TermOpen", {
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.cmd("startinsert") -- Ξεκίνα το terminal σε insert mode
    end,
})
