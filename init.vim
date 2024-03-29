lua require("aalyth")

call plug#begin()
	Plug 'preservim/nerdtree'	
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'bling/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	Plug 'elixir-editors/vim-elixir'
	Plug 'neovimhaskell/haskell-vim'

    Plug 'alx741/vim-rustfmt'
    Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
    Plug 'rhysd/vim-clang-format'

	Plug 'sainnhe/everforest'
    Plug 'nordtheme/vim'
    Plug 'andersevenrud/nordic.nvim'

    Plug 'aktersnurra/no-clown-fiesta.nvim'
    Plug 'nvim-lualine/lualine.nvim'
	Plug 'sainnhe/everforest'
    Plug 'nordtheme/vim'
    Plug 'andersevenrud/nordic.nvim'
call plug#end()

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

" Personal Laptop Setup
" colorscheme no-clown-fiesta 
" lua << END
" require('lualine').setup {
"     options = {
"         icons_enabled = false
"     }
" }
" END

" PC Setup
colorscheme nord
colorscheme nordic
let g:airline_theme = 'nord'

" CoC
" CocInstall coc-clangd coc-css coc-docker coc-html coc-html-css-support coc-java coc-json coc-python coc-rust-analyzer coc-snippets coc-toml coc-yaml
set updatetime=300 
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Automatic Formattings
" g:rustfmt_on_save = 1
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


" Mappings & Tabulation
tnoremap <Esc> <C-\><C-n>
set ts=4 sw=4 
set expandtab
