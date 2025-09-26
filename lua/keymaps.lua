-- Open current buffer in new tab
vim.keymap.set("n", "<leader>tn", function()
  local file_path = vim.fn.expand("%:p")
  vim.cmd(string.format("x | tabnew %s", file_path))
end, {})

-- Word deletion
vim.keymap.set("i", "<A-BS>", "<C-w>")

vim.keymap.set("n", "<leader>cb", function()
  if vim.g.theme == 'light' then
    vim.cmd("set background=dark")
    vim.g.theme='dark'
  else
    vim.cmd("set background=light")
    vim.g.theme='light'
  end
end, {desc = '[C]onfig [B]ackground', silent = true})

-- Further movements
vim.keymap.set({"n", "v"}, "J", "13j", { desc = "Up half page", remap = true })
vim.keymap.set({"n", "v"}, "K", "13k", { desc = "Down half page", remap = true })
vim.keymap.set({"n", "v"}, "<A-k>", "<C-u>zz", { desc = "Scroll with cursor middle", remap = true })
vim.keymap.set({"n", "v"}, "<A-j>", "<C-d>zz", { desc = "Scroll with cursor middle", remap = true })
-- vim.keymap.set({"n", "v"}, "U", "zz<C-u>", {})
-- vim.keymap.set({"n", "v"}, "D", "zz<C-d>", {})

-- Re-center
vim.keymap.set("n", "q", "zz", { desc = "Re-center", remap = true })

-- Commenting codes
vim.keymap.set({"n"}, "<leader>/", "gcc", {remap = true})
vim.keymap.set({"v"}, "<leader>/", "gc", {remap = true})

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

vim.keymap.set("n", "<C-e>", "<C-e>zz", {desc = "Curl window down", remap = true})
vim.keymap.set("n", "<C-y>", "<C-y>zz", {desc = "Curl window up", remap = true})

-- Move Lines
vim.keymap.set("n", "<C-A-j>", "<cmd>m .+1<cr>==", { desc = "Move Line Down" })
vim.keymap.set("i", "<C-A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("v", "<C-A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Whole Thing Down", silent = true })
vim.keymap.set("n", "<C-A-k>", "<cmd>m .-2<cr>==", { desc = "Move Line Up" })
vim.keymap.set("i", "<C-A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<C-A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Whole Thing Up", silent = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move between tabs, move tabs positions
-- vim.keymap.set("n", "<Tab>", ":tabnext<CR>", {desc = "Next Tab", remap = true, silent = true})
-- vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", {desc = "Next Tab", remap = true, silent = true})
vim.keymap.set("n", "<A-l>", ":tabnext<CR>", {desc = "Next Tab", remap = true, silent = true})
vim.keymap.set("n", "<A-h>", ":tabprevious<CR>", {desc = "Next Tab", remap = true, silent = true})
vim.keymap.set("n", "<A-L>", ":tabmove +1<CR>", {desc = "Next Tab", remap = true, silent = true})
vim.keymap.set("n", "<A-H>", ":tabmove -1<CR>", {desc = "Next Tab", remap = true, silent = true})

-- Folds
vim.keymap.set("n", "t", "za", {desc = "toggle fold", remap = true})

-- Change Working Directory
vim.keymap.set("n", "<leader>ccd", ":cd %:h<CR>", {desc = "[C]hange [C]urrent [D]irectory", remap = true, silent = true})
vim.keymap.set("n", "<leader>cud", function()
  local current_dir = vim.fn.getcwd()
  local parent_dir = vim.fn.fnamemodify(current_dir, ":h")
  vim.fn.chdir(parent_dir)
end, {desc = "[C]hange [U]p [D]irectory", remap = true, silent = true})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Escpate to Normal mode from Terminal mode" })

-- Easier frequently-used commands
vim.keymap.set("n", "<leader>x", ":x<CR>", {silent = true})
vim.keymap.set("n", "<leader><S-x>", ":wqa!<CR>", {desc = "write all files then exit", silent = true})
vim.keymap.set("n", "<leader>q", ":q<CR>", {silent = true})
vim.keymap.set("n", "<leader><S-Q>", ":qall!<CR>", {silent = true})
vim.keymap.set("n", "<leader>w", ":w<CR>", {silent = true})
