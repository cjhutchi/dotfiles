" plugins.vim - manage plugins via vim-plug.

" if plug.vim is not installed, install it.
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/wim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $HOME/.zshrc
endif

call plug#begin('~/.config/nvim/plugged')
" general {{{1

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " better autocomplete
  Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ncm2/float-preview.nvim'
  Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', } " language server
endif

Plug 'airblade/vim-gitgutter' " git gutter
Plug 'christoomey/vim-tmux-navigator' " make navigating VIM in tmux easier
Plug 'djoshea/vim-autoread' " read updates from file system
Plug 'ekalinin/Dockerfile.vim' " dockerfile support
Plug 'elzr/vim-json'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'} " the only necessary go plugin
Plug 'fszymanski/deoplete-emoji'
Plug 'godlygeek/tabular' " clean text up
Plug 'janko/vim-test' " test runner
Plug 'jparise/vim-graphql'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim' " zen mode
Plug 'junegunn/vim-plug'
Plug 'majutsushi/tagbar' " view ctags of current file
Plug 'morhetz/gruvbox'
Plug 'ngmy/vim-rubocop' " rubocop support
Plug 'othree/html5.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree' " folder explorer
Plug 'sheerun/vim-polyglot' " improved syntax highlighting
Plug 'terryma/vim-multiple-cursors' " multi-cursor support
Plug 'thoughtbot/vim-rspec' " rspec support
Plug 'tpope/vim-bundler' " bundler support
Plug 'tpope/vim-commentary' "comment block support
Plug 'tpope/vim-dadbod' " database helpers
Plug 'tpope/vim-dispatch' " async support
Plug 'tpope/vim-endwise' " smartly add end
Plug 'tpope/vim-eunuch' " unix helpers
Plug 'tpope/vim-fugitive' " git support
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag' " html, tag helpers
Plug 'tpope/vim-rails' " rails support
Plug 'tpope/vim-rhubarb' " github support
Plug 'tpope/vim-surround' " improved quote/brace support
Plug 'vim-airline/vim-airline' " sick bottom bar
Plug 'vim-airline/vim-airline-themes' " sick bottom bar themes
Plug 'vim-ruby/vim-ruby' " ruby support

" }}}1
call plug#end()

" vim:ft=vim:fdm=marker:fdl=0
