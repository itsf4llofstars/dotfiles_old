-- Neovim init.lua

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- [[ Lazy ]] {{{
require('lazy').setup({
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      { 'j-hui/fidget.nvim',       opts = {} },

      'folke/neodev.nvim',
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  { 'folke/which-key.nvim',          opts = {} },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- {
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },

  {
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  { 'numToStr/Comment.nvim',         opts = {} },

  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

  -- [[ Harpoon ]]
  { 'ThePrimeagen/harpoon',dependencies = { 'nvim-lua/plenary.nvim' } },

  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
  },
  { import = 'custom.plugins' },
}, {})
-- }}}


-- [[ Setting options ]] {{{
vim.cmd 'syntax on'
vim.cmd 'filetype plugin indent on'

vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'auto'
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 300
-- vim.o.completeopt = 'menuone,noselect'
vim.opt.completeopt = 'menuone,preview'
vim.opt.termguicolors = true
vim.cmd 'colorscheme retrobox'

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.guicursor = ""
vim.opt.autochdir = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'number'
vim.opt.scrolloff = 5
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.undofile = false
vim.opt.backup = false
-- }}}

-- [[ Basic Keymaps ]] {{{
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'i', 'v' }, 'kj', '<esc>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>w', ':write<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>q', ':quit!<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>z', ':write<CR>:quit<CR>', { silent = true })

vim.keymap.set({ 'n' }, '<leader>hh', '<cmd>lua require("harpoon.mark").add_file()<cr>')
vim.keymap.set({ 'n' }, '<leader>hm', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>')
vim.keymap.set({ 'n' }, '<leader>ha', '<cmd>lua require("harpoon.ui").nav_file(1)<cr>')
vim.keymap.set({ 'n' }, '<leader>hs', '<cmd>lua require("harpoon.ui").nav_file(2)<cr>')
vim.keymap.set({ 'n' }, '<leader>hd', '<cmd>lua require("harpoon.ui").nav_file(3)<cr>')
vim.keymap.set({ 'n' }, '<leader>hf', '<cmd>lua require("harpoon.ui").nav_file(4)<cr>')
vim.keymap.set({ 'n' }, '<leader>hn', '<cmd>lua require("harpoon.ui").nav_next()<cr>')
vim.keymap.set({ 'n' }, '<leader>hp', '<cmd>lua require("harpoon.ui").nav_prev()<cr>')
vim.keymap.set({ 'n' }, '<leader>ht', '<cmd>Telescope harpoon marks<cr>')

vim.keymap.set(
  { 'n' },
  '<localleader>e',
  ':edit ~/.config/nvim/init.lua<CR>',
  { silent = true }
)
vim.keymap.set({ 'n' }, '<leader>o', ':edit .<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>t', ':terminal<CR>', { silent = true })
vim.keymap.set({ 't' }, '<ESC>', '<C-\\><C-n>', { silent = true })
vim.keymap.set({ 't' }, '<C-v><ESC>', '<ESC>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>p', '"+p', { silent = true })
vim.keymap.set({ 'n' }, "'", "`", { silent = true })
vim.keymap.set({ 'n' }, "''", "``", { silent = true })
vim.keymap.set({ 'n' }, '<S-b>', '_', { silent = true })
vim.keymap.set({ 'n' }, '<S-e>', '$', { silent = true })
vim.keymap.set({ 'n' }, '<S-y>', 'y$', { silent = true })
vim.keymap.set({ 'n' }, 'w', 'W', { silent = true })
vim.keymap.set({ 'n' }, '<S-n>', 'Nzz', { silent = true })
vim.keymap.set({ 'n' }, 'n', 'nzz', { silent = true })
vim.keymap.set({ 'n' }, '<leader>in', ":normal! mpHmogg=G'ozt`p<CR>")
vim.keymap.set({ 'n' }, '<leader>bn', ':bnext<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>bp', ':bprevious<CR>', { silent = true })
vim.keymap.set({ 'n' }, ',a', 'zt', { silent = true })
vim.keymap.set({ 'n' }, ',b', 'zb', { silent = true })
vim.keymap.set({ 'n' }, ',z', 'zz', { silent = true })
vim.keymap.set({ 'n' }, '<F8>', '@', { silent = true })
vim.keymap.set({ 'n' }, '<F9>', '@@', { silent = true })
vim.keymap.set({ 'v' }, '<S-j>', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set({ 'v' }, '<S-k>', ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set({ 'v' }, '>', '>gv', { silent = true })
vim.keymap.set({ 'v' }, '<', '<gv', { silent = true })
vim.keymap.set({ 'n' }, "<leader>'", "viw<ESC>a'<ESC>bi'<ESC>lel", { silent = true })
vim.keymap.set({ 'n' }, '<leader>"', 'viw<ESC>a"<ESC>bi"<ESC>lel', { silent = true })
vim.keymap.set({ 'n' }, '<leader>(', 'viw<ESC>a)<ESC>bi(<ESC>lel', { silent = true })
vim.keymap.set({ 'n' }, '<leader>{', 'viw<ESC>a}<ESC>bi{<ESC>lel', { silent = true })
vim.keymap.set({ 'n' }, '<leader>[', 'viw<ESC>a]<ESC>bi[<ESC>lel', { silent = true })
vim.keymap.set({ 'n' }, '<leader><', 'viw<ESC>a><ESC>bi<<ESC>lel', { silent = true })
vim.keymap.set({ 'n' }, '<leader>v', '<C-w>v<C-w>l', { silent = true })
vim.keymap.set({ 'n' }, '<leader>s', '<C-w>s<C-w>j', { silent = true })
vim.keymap.set({ 'n' }, '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set({ 'n' }, '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set({ 'n' }, '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set({ 'n' }, '<C-l>', '<C-w>l', { silent = true })
vim.keymap.set({ 'n' }, '<localleader>hh', ':vertical resize+5<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<localleader>ll', ':vertical resize-5<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<localleader>kk', ':resize+5<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<localleader>jj', ':resize-5<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<localleader>rs', ':<C-w>=', { silent = true })
vim.keymap.set({ 'n' }, '<leader>ga', ':Git add .<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>gc', ':Git commit<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<leader>gl', ':Git log --oneline --decorate --graph --all<CR>', { silent = true })
vim.keymap.set({ 'n' },
  '<localleader>sh',
  'gg/<<<<<<<<CR>dd/=======<CR>V/>>>>>>><CR>d<ESC>',
  { silent = true }
)
vim.keymap.set({ 'n' },
  '<localleader>st',
  'gg/<<<<<<<<CR>V/=======<CR>d/>>>>>>><CR>dd<ESC>',
  { silent = true }
)
vim.keymap.set({ 'n' },
  '<localleader>sb',
  'gg/<<<<<<<<CR>dd/=======<CR>dd/>>>>>>><CR>dd<ESC>',
  { silent = true }
)
vim.keymap.set({ 'n' },
  '<localleader>sn',
  'gg/<<<<<<<<CR>',
  { silent = true }
)

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
-- }}}

-- [[ Configure harpoon ]]
require('telescope').load_extension('harpoon')
require("harpoon").setup({
  enter_on_sendcmd = false,
  excluded_filetypes = { "harpoon" },
  menu = {
    width = vim.api.nvim_win_get_width(0) - 50,
  }
})

-- [[ Configure Telescope ]]
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- [[ Configure Treesitter ]]
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },

  auto_install = false,

  highlight = { enable = true },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set('n', '<localleader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap(',k', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<M-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  -- clangd = {},
  -- pyright = {},
  rust_analyzer = {},
  -- tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

require('neodev').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

-- [[ AUGROUP AUTOCMD ]] {{{
local ALL = vim.api.nvim_create_augroup("all_files", { clear = true })
local VIMLUA = vim.api.nvim_create_augroup("vimlua_files", { clear = true })
local C = vim.api.nvim_create_augroup("c_files", { clear = true })
local RUST = vim.api.nvim_create_augroup("rust_files", { clear = true })
local TEXT = vim.api.nvim_create_augroup("text_files", { clear = true })
local PYTHON = vim.api.nvim_create_augroup("python_files", { clear = true })
local GIT = vim.api.nvim_create_augroup("git_files", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = { "*" },
  group = ALL,
  command = "set nornu",
  desc = "Turn off relative numbers when entering insertmode",
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = { "*" },
  group = ALL,
  command = "set rnu",
  desc = "Turn on relative numbers when exiting insertmode",
})
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  group = ALL,
  command = ":source /home/bumper/.config/nvim/neovim.vim",
  desc = "Place cursor at beginning of line it was on when last exited",
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  group = ALL,
  command = ":%s/\\s\\+$//e",
  desc = "Remove trailing whitspace on file save"
})
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = { "*" },
--   group = ALL,
--   command = ":normal! mpgg=G`p",
--   desc = "Auto indent on file save"
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "vim", "lua" },
  group = VIMLUA,
  command = "set ts=2 sw=2 sts=2 tw=0 et nowrap fdc=3 fdm=marker",
  desc = "Settings for entering a lua or vim file",
})
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   pattern = { "init.lua" },
--   group = VIMLUA,
--   command = ":source ~/.config/nvim/main.lua",
-- })

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp", "rust" },
  group = C,
  command = "set ts=4 sw=4 sts=4 tw=0 nosi noai noci cc=80 cin cino=ln,c2 fdc=4 fdm=indent",
  desc = "Settings for entering a c files",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rust" },
  group = RUST,
  command = "nnoremap <leader>cc :!cargo check<CR>",
  desc = "Run cargo check",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rust" },
  group = RUST,
  command = "nnoremap <leader>cb :!cargo build<CR>",
  desc = "Run cargo build",
})
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "rust" },
  group = RUST,
  command = "nnoremap <leader>cr :!cargo run<CR>",
  desc = "Run cargo run",
})

vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = { "*.txt" },
  group = TEXT,
  command = "colorscheme slate",
  desc = "Set colorscheme entering text files",
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
  pattern = { "*.txt" },
  group = TEXT,
  command = "colorscheme retrobox",
  desc = "Set colorscheme exiting text files",
})

vim.api.nvim_create_autocmd({ "filetype" }, {
  pattern = { "gitcommit" },
  group = GIT,
  command = "setlocal cc=50 nowrap et",
  desc = "Set local settings for the git commit window",
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "python" },
  group = PYTHON,
  command = "setlocal fdm=indent fdc=4 cc=100",
  desc = "Settings for python files",
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "lua",
--   callback = function(args)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
--   end
-- })
-- }}}
