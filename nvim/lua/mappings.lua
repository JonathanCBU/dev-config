-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- File saving and quitting
vim.keymap.set('n', '<leader>q', '<cmd>q!<CR>')
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>')
vim.keymap.set('n', '<leader>z', '<cmd>wq<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Go back to file explorer
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Open file explorer' })

-- Yanking and pasting reconfig
vim.keymap.set('n', 'Y', 'yiw', { desc = 'Yank word from inside' })
vim.keymap.set('n', 'y', 'Y', { desc = 'Yank whole line on single `y`' })
vim.keymap.set('n', '<leader>p', '"_diw"0P', { desc = 'Paste word underline without overwriting register' })
vim.keymap.set('n', '<leader>x', '*``cgn', { desc = 'Replace word with "." to replace next instances' })

-- Quick Movement
vim.keymap.set({ 'n', 'v' }, '<leader>j', '10j', { desc = 'Move 10 lines down' })
vim.keymap.set({ 'n', 'v' }, '<leader>k', '10k', { desc = 'Move 10 lines up' })

-- Buffer Navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })

-- Config Access
vim.keymap.set('n', '<leader>ev', ':e $MYVIMRC<CR>', { desc = 'Edit vim config' })
