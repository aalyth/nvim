# My minimalist Neovim setup
## Requirements
Before you start setting up your neovim configuration you must have first installed Neovim and the [Vim-Plug manager](https://github.com/junegunn/vim-plug).
## Setup
Clone the repository and open the file `init.vim`. Run the command `:PlugInstall` and then `:so`. After the installations are finished feel free to comment out the line:
```Vim
CocInstall coc-clangd coc-css coc-docker coc-html coc-html-css-support coc-java coc-json coc-python coc-rust-analyzer coc-snippets coc-toml coc-yaml 
```
so you don't receive any error messages while loading Neovim.
