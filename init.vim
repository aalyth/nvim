lua require("aalyth")

lua vim.opt.clipboard = 'unnamedplus'

call plug#begin()
        Plug 'preservim/nerdtree'	
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'bling/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        
        Plug 'elixir-editors/vim-elixir'
        Plug 'neovimhaskell/haskell-vim'
        Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
        
        Plug 'alx741/vim-rustfmt'
        Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
        Plug 'rhysd/vim-clang-format'
        Plug 'psf/black', { 'branch': 'stable' }
        
        Plug 'sainnhe/everforest'
        Plug 'nordtheme/vim'
        Plug 'andersevenrud/nordic.nvim'
        
        Plug 'aktersnurra/no-clown-fiesta.nvim'
        Plug 'nvim-lualine/lualine.nvim'
        Plug 'sainnhe/everforest'
        Plug 'nordtheme/vim'
        Plug 'andersevenrud/nordic.nvim'
call plug#end()
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1

" NERDTree
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeShowHidden=1

" Everforest
if has('termguicolors')
  set termguicolors
endif

" let g:everforest_background = 'soft'
" let g:everforest_better_performance = 1
" colorscheme everforest

" colorscheme nord
" colorscheme nordic
" let g:airline_theme = 'nord'

colorscheme no-clown-fiesta 
lua << END
require('lualine').setup {
    options = {
        icons_enabled = false
    }
}
END

" CoC
set updatetime=300 
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Automatic Formattings
g:rustfmt_on_save = 1
autocmd FileType c ClangFormatAutoEnable

lua <<EOF
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.cmd('GoFmt')
  end,
  group = format_sync_grp,
})
EOF

autocmd BufWritePre *.py execute ':Black'
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" Mappings & Tabulation
tnoremap <Esc> <C-\><C-n>
autocmd BufRead *.js,*.ts,*.jsx,*.tsx setlocal shiftwidth=2 softtabstop=2
autocmd BufRead *.txt setlocal shiftwidth=4 softtabstop=4
set expandtab

syntax enable
source ~/.vim/ftdetect/ch.vim

set colorcolumn=80
