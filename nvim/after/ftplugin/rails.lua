-- Disable default mapping
vim.keymap.set('n', '[rails]', '<Nop>', {noremap = true, silent = true})

-- Setup prefix for Rails commands
vim.keymap.set('n', '<Space>r', '[rails]', {noremap = true, silent = true})

-- Define Rails commands
local rails_mappings = {
    m = "Emodel ",
    v = "Eview ",
    c = "Econtroller ",
    s = "Espec ",
    t = "Eunittest ",
    tt = "Eunittest \n",
    u = "Eunittest ",
    e = "Eenvironment ",
    i = "Einitializer ",
    ss = "Eschema ",
    r = "R\n",
    a = "A\n",
}

for keys, command in pairs(rails_mappings) do
    vim.keymap.set('n', '[rails]'..keys, ':'..command, {noremap = true, silent = false})
end
