vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<leader>jj", "<Esc>")
vim.keymap.set("n", "<leader>s", ":w<CR>")
vim.keymap.set("n", "<leader>qq", ":qa<CR>")
vim.keymap.set("n", "<leader> ", ":")
vim.cmd("set number")
vim.cmd("set relativenumber")

-- window related actions
vim.keymap.set("n", "<leader>ws", "<C-w>s")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>wj", "<C-w>j")
vim.keymap.set("n", "<leader>wk", "<C-w>k")
vim.keymap.set("n", "<leader>wh", "<C-w>h")
vim.keymap.set("n", "<leader>wl", "<C-w>l")
vim.keymap.set("n", "<leader>wq", "<C-w>q")

-- vim.keymap.set("v", "<leader>a", ":'<,'>:w !festival --tts<CR>")


-- install lazy from github and then set local variables
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- plugins im trying to develop
    { "bluz71/vim-moonfly-colors",  name = "moonfly",  lazy = false, priority = 1000 },
    { "nickbhorton/nicktheme.nvim", name = "nicktheme" },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    'nvim-telescope/telescope-ui-select.nvim',
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-nvim-lsp",
    {
        "mcchrish/zenbones.nvim",
        dependencies = {
            "rktjmp/lush.nvim",
        }
    },
}
local opts = {}

-- setup lazy
require("lazy").setup(plugins, opts)


-- setup moonfly which is a color scheme vim.cmd.colorscheme("kanagawa-dragon")
-- Default options:
require('kanagawa').setup({
    compile = true,   -- enable compiling the colorscheme
    undercurl = true, -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,   -- do not set background color
    dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {             -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "dragon",    -- Load "wave" theme when 'background' option is not set
    background = {       -- map the value of 'background' option to a theme
        dark = "dragon", -- try "dragon" !
        light = "lotus"
    },
})

vim.keymap.set("n", "<leader>csw", ":colorscheme kanagawa-wave<CR>")
vim.keymap.set("n", "<leader>csd", ":colorscheme kanagawa-dragon<CR>")
vim.keymap.set("n", "<leader>csl", ":colorscheme kanagawa-lotus<CR>")
vim.keymap.set("n", "<leader>csn", ":colorscheme kanagawa-nick<CR>")
vim.keymap.set("n", "<leader>csm", ":colorscheme moonfly<CR>")
vim.keymap.set("n", "<leader>csz1", ":colorscheme zenbones<CR>")
vim.keymap.set("n", "<leader>csz2", ":colorscheme neobones<CR>")
vim.keymap.set("n", "<leader>csz3", ":colorscheme vimbones<CR>")
vim.keymap.set("n", "<leader>csz4", ":colorscheme rosebones<CR>")
vim.keymap.set("n", "<leader>csz5", ":colorscheme forestbones<CR>")
vim.keymap.set("n", "<leader>csz6", ":colorscheme nordbones<CR>")
vim.keymap.set("n", "<leader>csz7", ":colorscheme tokyobones<CR>")
vim.keymap.set("n", "<leader>csz8", ":colorscheme seoulbones<CR>")
vim.keymap.set("n", "<leader>csz9", ":colorscheme randombones<CR>")
vim.keymap.set("n", "<leader>csb", ":colorscheme 256_noir<CR>")
vim.keymap.set("n", "<leader>bgl", ":set background=light<CR>")
vim.keymap.set("n", "<leader>bgd", ":set background=dark<CR>")
vim.cmd("colorscheme moonfly")

-- setup treesitter
local configs = require("nvim-treesitter.configs")
configs.setup({
    ensure_installed = { "python", "doxygen", "gitcommit", "comment", "make", "cpp", "asm", "c", "lua", "vim", "vimdoc", "html", "css", "javascript", "typescript", "regex", "bash", "markdown", "markdown_inline" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})

--[[
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.deoxygen = {
  install_info = {
    url = "/home/nick/dev/tree-sitter-doxygen", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = true, -- if folder contains pre-generated src/parser.c
  },
  filetype = "cc", -- if filetype does not match the parser name
}
--]]

-- setup neo-tree
require("neo-tree").setup({
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,
    filesystem = {
        filtered_items = {
            visible = false,
            show_hidden_count = true,
            hide_dotfiles = false,
            hide_gitignored = true,
            hide_by_name = {
                ".git"
                -- '.DS_Store',
                -- 'thumbs.db',
            },
            never_show = {},
        },
    },
    window = {
        position = "right",
        width = "50"
    }
})
vim.keymap.set("n", "<leader>nn", ":Neotree filesystem reveal<CR>")
vim.keymap.set("n", "<leader>nc", ":Neotree filesystem close<CR>")

-- setup mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd", "html", "cssls" }
})


-- setup telescope ui select
require("telescope").setup {
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
        }
    }
}
require("telescope").load_extension("ui-select")

local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    })
})

-- setup for nvim-lsp config
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup({
    capabilities = capabilities
})
lspconfig.clangd.setup({
    capabilities = capabilities
})
lspconfig.html.setup({
    capabilities = capabilities
})
lspconfig.cssls.setup({
    capabilities = capabilities
})
lspconfig.tsserver.setup({
    capabilities = capabilities
})
lspconfig.asm_lsp.setup({
    capabilities = capabilities
})
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>fo', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- setup telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fn", builtin.man_pages)
vim.keymap.set("n", "<leader>fm", builtin.marks)
vim.keymap.set("n", "<leader>fcc", builtin.git_commits)
vim.keymap.set("n", "<leader>fcbu", builtin.git_bcommits)
vim.keymap.set("n", "<leader>fcbr", builtin.git_branches)
vim.keymap.set("n", "<leader>fcs", builtin.git_status)
vim.keymap.set("n", "<leader>ft", builtin.treesitter)
