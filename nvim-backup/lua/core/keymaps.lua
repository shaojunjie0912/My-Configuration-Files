vim.g.mapleader = " "

local keymap = vim.keymap

---------- Insert Mode ----------
keymap.set("i", "jk", "<ESC>")

---------- Visual Mode ----------
-- Move one or more lines
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

---------- Search highlight ----------
keymap.set("n", "<leader>nh", ":nohl<CR>")

---------- Turn off arrow keys ----------
keymap.set({"n", "i"}, "<Left>", "<Nop>")
keymap.set({"n", "i"}, "<Right>", "<Nop>")
keymap.set({"n", "i"}, "<Up>", "<Nop>")
keymap.set({"n", "i"}, "<Down>", "<Nop>")
