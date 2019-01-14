call plug#begin()
Plug 'tomasr/molokai'
Plug 'slashmili/alchemist.vim'
Plug 'kassio/neoterm'
Plug 'neomake/neomake'
Plug 'universal-ctags/ctags'
Plug 'aurieh/discord.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'osyo-manga/vim-monster'
Plug 'majutsushi/tagbar'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-jp/syntax-vim-ex'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/vim-gitbranch'

" ruby language server
Plug 'Shougo/deoplete.nvim'
Plug 'uplus/deoplete-solargraph'

" ruby and ror support
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby','haml','slim','eruby'] }
Plug 'tpope/vim-rbenv', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endvise', { 'for': 'ruby' }
Plug 'tpope/vim-rake', { 'for': 'ruby' }
Plug 'Keithbsmiley/rspec.vim', { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

" For front-end
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script', { 'for': ['coffee', 'haml', 'eruby'] }
Plug 'tpope/vim-haml'
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'

" Other
Plug 'tpope/vim-surround'
Plug 'vim-scripts/vim-auto-save'
call plug#end()

colorscheme molokai
setl number

set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set list

set showtabline=2
set mouse=a

set wildignore+=tags
set wildignore+=*/tmp/*
set wildignore+=*/public/*
set wildignore+=*/log/*
set wildignore+=*.png,*.jpg,*.otf,*.jpeg,*.webm

" NERDTree customization
map <C-p> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable autosave file
let g:auto_save = 1

" Enable Ruby linters
let g:neomake_ruby_enabled_makers = ['rubocop', 'reek']
let g:neomake_highlight_columns = 1

" Rubocop fix current file
nmap <leader>rc :call RubocopAutoFix()<CR>

call neomake#configure#automake('nwri')

