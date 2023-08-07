# My minimalist Neovim setup
## Requirements
* Neovim nightly (```sudo snap install neovim --classic```)
* [Vim-Plug](https://github.com/junegunn/vim-plug)
* [packer.nvim](https://github.com/wbthomason/packer.nvim)

## Setup
Clone the repository and open the file `init.vim`. Run the command `:PlugInstall` and `:PackerSync`. After the installations are finished, run the given command inside nvim:
```Vim
:CocInstall coc-clangd coc-css coc-docker coc-html coc-html-css-support coc-java coc-json coc-python coc-rust-analyzer coc-snippets coc-toml coc-yaml 
```
## Elixir CoC LSP setup
In order to properly configure your Elixir CoC LSP server you first need to have installed:

### Elixir 
``` Shell
sudo add-apt-repository ppa:rabbitmq/rabbitmq-erlang
sudo apt update
sudo apt install elixir
```

### Erlang
``` Shell
sudo apt-get install erlang
```
You can test your installation by running ```erl```, but if you receive a similiar message:
```
No version is set for command erl
Consider adding one of the following versions in your config file at 
erlang 26.0.2
```
You need to create the file ```~/.tool-versions``` and add the corresponding version there.

### Elixir Language Server (LS)
You can follow the installation of ```elixir-ls``` [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#elixirls).

### CoC setup
After you have installed Elixir, Erlang and elixir-ls, you need to add the path where you installed the elixir-ls to the file ```~/.config/nvim/coc-settings.json``` and inside nvim run ```:CocInstall coc-elixir```.
