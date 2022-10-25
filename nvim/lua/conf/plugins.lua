local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
    function(use)
        use('wbthomason/packer.nvim')
        use('nvim-lua/plenary.nvim')

        -- Theme
        use('RRethy/nvim-base16')
        use('gosukiwi/vim-atom-dark')

        -- Editor
        use('tpope/vim-commentary')
        use('mg979/vim-visual-multi')
        use('rhysd/clever-f.vim')

        -- Misc
        use('sheerun/vim-polyglot')
    end
})
