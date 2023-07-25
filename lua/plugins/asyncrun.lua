local keymap = vim.keymap

-- automatically open quickfix window when AsyncRun command is executed
-- set the quickfix window 6 lines height.
vim.g.asyncrun_open = 8
vim.g.asyncrun_rootmarks = { '.svn', '.git', '.root', '_darcs', 'build.xml' }

-- F8 to toggle quickfix window
-- keymap.set("n", "<F6>", ":AsyncRun -cwd=<root> -raw make", {noremap = true, silent = true})
-- keymap.set("n", "<F7>", ":AsyncRun -cwd=<root> cmake -S .  -B build", {noremap = true, silent = true})
keymap.set("n", "<F8>", ":call asyncrun#quickfix_toggle(6)<CR>", { noremap = true, silent = true })
