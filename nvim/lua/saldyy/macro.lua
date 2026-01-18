-- Custom Macros --


-- JS/TS
local esc = vim.api.nvim_replace_termcodes("<ESC>", true, true, true)

vim.api.nvim_create_augroup("JSMacro", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "JSMacro",
  pattern = { "javacript", "typescript" },
  callback = function()
    vim.fn.setreg("l", "yoconsole.log(\"" .. esc .. "pa:\"" .. esc .. "a, " .. esc .. "pa)" .. esc)
  end,
})
