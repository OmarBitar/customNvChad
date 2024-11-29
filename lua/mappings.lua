require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- lsp
map("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references" }) -- show definition, references
map("n", "gD", vim.lsp.buf.declaration, { desc = "past" } ) -- go to declaration
map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "past" }) -- show lsp definitions
map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "past" }) -- show lsp implementations
map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "past" }) -- show lsp type definitions
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "past" }) -- see available code actions, in visual mode will apply to selection

map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "past" }) -- smart rename

map("n", "<leader>rs", ":LspRestart<CR>", { desc = 'Restart LSP'}) -- mapping to restart lsp if necessary
map("n", "<leader>q", ":qa!<CR>", { desc = 'Quit Neovim'}) -- mapping to restart lsp if necessary


-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

-- window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- workspace
map("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
map("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory

-- nvim tree
map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer

-- formatting
local conform = require("conform")
map({ "n", "v" }, "<leader>=", function()
    conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
    })
end, { desc = "Format file or range (in visual mode)" })
