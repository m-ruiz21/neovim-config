local colorscheme = "material"

vim.g.material_style = "deep ocean"
require("material").setup({
    disable = 
    {
        eob_lines = true
    },
    plugins = 
    {
        "gitsigns",
        "telescope",
        "which-key",
        "nvim-tree"
    },
    lualine_style = "stealth"
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
