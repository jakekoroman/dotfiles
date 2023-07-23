require('plugins')
require('settings')
require('keybinds')

local api = vim.api

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

-- Snippet settings
require('snippets').snippets = {
  _global = {
    todo = "/* TODO(jake): $0 */";
    note = "/* NOTE(jake): $0 */";
    inc  = "#include <$0>";
    incq  = "#include \"$0\"";
  }
}

require('marks').setup {
  -- whether to map keybinds or not. default true
  default_mappings = true,
  -- whether movements cycle back to the beginning/end of buffer. default true
  cyclic = true,
  -- how often (in ms) to redraw signs/recompute mark positions. 
  -- higher values will have better performance but may cause visual lag, 
  -- while lower values may cause performance penalties. default 150.
  refresh_interval = 250,
  -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
  -- marks, and bookmarks.
  -- can be either a table with all/none of the keys, or a single number, in which case
  -- the priority applies to all marks.
  -- default 10.
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = false,
  },
  mappings = {}
}
