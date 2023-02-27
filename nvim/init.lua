require('plugins')
require('settings')
require('keybinds')

local api = vim.api
local fn = vim.fn

-- Returns an array of filenames in given directory
function scan_dir(dir)
    local i, t, popen = 0, {}, io.popen
    local pfile = popen('ls -a "'..dir..'"')
    for filename in pfile:lines() do
        i = i + 1
        t[i] = filename
    end
    pfile:close()
    return t
end

-- Function searchs directory for build tools and
-- sets makeprg to it if possible
function locate_build()
    local cwd = fn.getcwd()
    local files = scan_dir(cwd)

    for _, file in pairs(files) do
        if file == 'build.sh' then
            api.nvim_command('set makeprg=./build.sh')
        end
    end
end

-- Attempts to set build tool in makeprg when nvim starts
api.nvim_create_autocmd({ "VimEnter" }, {
  callback = locate_build,
})

-- Auto save when running :make
api.nvim_create_autocmd({ "QuickFixCmdPre" }, {
  callback = function()
    vim.cmd ":w"
  end,
})

-- Tree sitter settings
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "lua", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}
