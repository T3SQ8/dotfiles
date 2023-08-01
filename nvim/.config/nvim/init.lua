-- vim: et sw=4

--
-- PLUGINS
--

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'junegunn/fzf.vim',
        requires = {
            'junegunn/fzf',
            run = function() vim.fn['fzf#install']() end
        }
    }

    use 'tpope/vim-repeat'
    use 'dhruvasagar/vim-table-mode' -- :TableModeEnable for automatic table formatting

    use 'freitass/todo.txt-vim'
    use 'zaid/vim-rec'
    use 'ledger/vim-ledger'

    use {
        'nvim-orgmode/orgmode',
        requires = 'nvim-treesitter/nvim-treesitter',
        config = function()
            require('orgmode').setup{}
        end
    }

    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline'
        }
    }

    use {
        'piero-vic/cmp-ledger',
        requires = "nvim-lua/plenary.nvim"
    }

    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons'
    }
end)

-- nvim-cmp setup
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.confirm({ select = true })
    }),
    sources = cmp.config.sources({
        { name = 'ledger' },
        { name = 'orgmode' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- orgmode setup
require('orgmode').setup_ts_grammar()
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {'org'},
    },
    ensure_installed = {'org'},
}

require('orgmode').setup({
    org_agenda_files = {'~/notes/todos/*.org'},
    org_default_notes_file = '~/notes/todos/refile.org',
    org_todo_keywords = {'TODO', '|', 'DONE', 'CANCELED', 'DELEGATED'},
    org_capture_templates = {
        t = {
            description = 'Task',
            template = '* TODO %?'
        },
        j = {
            description = 'Journal',
            template = '\n* %<%Y-%m-%d>\n%?',
            target = '~/notes/journal.org'
        }
    },
    org_indent_mode = 'noindent',
    -- org_agenda_span = 'month',
    org_tags_column = 0,
    org_priority_highest = 'A',
    org_priority_lowest = 'F',
    org_priority_default = 'C',
})

vim.g.vsnip_snippet_dir = vim.fn.expand('$XDG_CONFIG_HOME') .. '/nvim/snippets'

vim.cmd [[
imap <expr> <Tab>   vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'
]]

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup({
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
        git_ignored = false,
    },
})

vim.keymap.set("n", "<C-f>", vim.cmd.NvimTreeToggle)

--
-- SETTINGS
--

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.hidden = false
vim.opt.timeout = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.linebreak = true
vim.opt.foldenable = false
vim.opt.spell = true
vim.opt.spelllang = nil
vim.opt.mouse = 'a'
vim.opt.wrap = false
vim.opt.textwidth = 80
vim.opt.colorcolumn = "+1"
vim.opt.viewoptions:remove {"folds", "curdir"}
vim.opt.formatoptions:remove {"tc"} -- don't autowrap text or comments
vim.opt.mousemodel = nil
vim.opt.undofile = true
vim.opt.backupskip:append {vim.fn.expand("$HOME") .. "/mnt/*"}

vim.g.templateDir = vim.fn.stdpath('config') .. '/snippet/'

vim.cmd.highlight('clear SpellBad')
vim.cmd.highlight('link SpellBad DiagnosticError')

vim.cmd.highlight('ColorColumn ctermbg=darkgray')

if vim.fn.has('win32') == 1 then
    vim.opt.guifont = "consolas:h15" -- TODO This needed?
    vim.opt.shell = [[C:\Program Files\Git\usr\bin\sh]] -- TODO Test this
    vim.cmd.colorscheme('habamax')
end

vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    command = "silent! mkview",
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    command = "silent! loadview",
})

vim.api.nvim_create_autocmd("QuickFixCmdPre", {
    pattern = "make",
    command = "update",
})

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({higroup="IncSearch", timeout=100, on_visual=false})
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
})

--
-- KEYMAPS
--

vim.g.mapleader = " "

-- clipboard
vim.keymap.set("v", "<C-c>", "\"+y")
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("i", "<C-v>", "<C-o>:set paste<CR><C-r>+<C-o>:set nopaste<CR>")

-- mouse
vim.keymap.set("n", "<C-LeftMouse>", "<LeftMouse>.", { remap = true}) -- Set remap to accommodate vim-repeat
vim.keymap.set({"n", "v", "i"}, "<MiddleMouse>", "<Nop>")

-- command-line and terminal
vim.api.nvim_create_user_command('W', 'write', {})
vim.api.nvim_create_user_command('Q', 'quit', {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
vim.keymap.set("n", "<Leader>t", function()
    vim.cmd(math.floor(vim.fn.winheight(0) / 3) .. "split +terminal")
end)

-- misc
vim.keymap.set("n", "<Leader>x", "/<++><CR>\"_ca<")
vim.keymap.set("n", "<Leader>w", function() vim.cmd "setlocal wrap!" end)
vim.keymap.set("n", "m", "]sz=")
vim.keymap.set("n", "M", "[sz=")
vim.keymap.set("n", "<C-n>", ":next<CR>")
vim.keymap.set("n", "<C-p>", ":previous<CR>")
vim.keymap.set("v", "<C-r>", [["ay:%s/\<<C-r>a\>//g<Left><Left>]]) -- search and replace
vim.keymap.set("n", "gq", "gw")
vim.keymap.set("n", "gqq", "gww")

langs = {'en', 'sv', 'fr', ''}
local lang_index = 1
vim.keymap.set("n", "<Leader>l", function()
    vim.opt.spelllang = langs[lang_index]
    lang_index = lang_index + 1
    if lang_index > #langs then
        lang_index = 1
    end
    print(string.format('spell: %s spelllang: %s', vim.o.spell, vim.o.spelllang))
end)

vim.keymap.set("n", "<Leader>C", function()
    vim.notify(vim.fn.system(vim.fn.shellescape(vim.fn.expand('%:p'))))
end)

vim.api.nvim_create_user_command('Open', function(opts)
    local open
    if vim.fn.has('unix') == 1 then
        open = 'xdg-open'
    elseif vim.fn.has('win32') == 1 then
        open = 'start'
    elseif vim.fn.has('mac') == 1 then
        open = 'open'
    end
    vim.fn.jobstart({open, opts.fargs[1]}, {detach = true})
end,
{ nargs = '+', complete = 'file' })

vim.keymap.set("n", "<Leader>O", function()
    vim.fn['fzf#run'] {
        source = 'find -iname ' .. vim.fn.shellescape(vim.fn.expand('%:r') .. '.*'),
        sink = 'Open'
    }
end)

vim.keymap.set("v", "<Leader>q", ":Blockseq<CR>")
vim.api.nvim_create_user_command('Blockseq', function(opts)
    local start_x, start_y = unpack(vim.fn.getpos("'<"), 2, 3)
    local end_x, end_y = unpack(vim.fn.getpos("'>"), 2, 3)
    local num
    if opts.fargs[1] then num = opts.fargs[1] else num = 1 end
    reset_column = math.max(start_y, end_y)
    for row=start_x,end_x do
        vim.fn.cursor(row, reset_column)
        vim.cmd("normal! R" .. num)
        num = num + 1
    end
end,
{ nargs = '?', range = true })

vim.api.nvim_create_user_command('Visualwrap', function(opts)
    local before_text = opts.fargs[1]
    local after_text = opts.fargs[2]
    local start_pos = { unpack(vim.fn.getpos("'<"), 2, 3) }
    local end_pos = { unpack(vim.fn.getpos("'>"), 2, 3) }
    vim.fn.cursor(end_pos)
    vim.cmd("normal! a" .. after_text)
    vim.fn.cursor(start_pos)
    vim.cmd("normal! i" .. before_text)
end,
{ nargs = '+', range = true })
