map <Space> <Leader>

let gruvbox_flat_style = "dark"
let material_style = "lighter"
let neon_style="dark"
let g:tokyonight_style = "night"
let g:tokyonight_colors = {
      \ "bg": "#222325"
      \ }
let ayucolor="light"
set t_Co=256
syntax enable
set background=dark
set termguicolors
colorscheme gruvbox-flat

set autowrite " automatically :write before running commands
set cmdheight=2 " give more space for displaying messages.
set completeopt=menuone,noselect
set cursorline " highlight current line
set expandtab " always uses spaces instead of tab characters
set hidden
set ignorecase
set inccommand="nosplit" " incremental live completion
set list listchars=tab:\ \ ,trail:·
set mouse=a " can click around in terminal window
set nobackup
set nohlsearch
set noincsearch
set noswapfile
set nowb
set nowrap
set number
set scrolloff=10
set shiftwidth=2
set shortmess+=c " don't give |ins-completion-menu| messages.
set signcolumn=yes " always show the signcolumn, otherwise it would shift the diagnostics.
set smartcase
set softtabstop=2
set tabstop=2
set termguicolors
set updatetime=300
set wildmode=list:longest,list:full
set relativenumber

inoremap jj <esc>

" highlight after 120 characters
augroup vimrc_autocmds
  " TODO: make this dynamic
  " for dark bg:
  autocmd BufEnter * highlight OverLength ctermfg=red guibg=#592929
  " for light bg:
  " autocmd BufEnter * highlight OverLength ctermfg=red guibg=#ffdfd9
  autocmd BufEnter * match OverLength /\%120v.*/
augroup END

" easier split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" NERDTree
nnoremap <leader>E :NERDTreeFind<cr>
nnoremap <leader>V :action GotoTest<cr>
nnoremap <leader>cn :action GotoNextError<cr>
nnoremap <leader>cp :action GotoPreviousError<cr>
nnoremap <leader>e :NERDTreeToggle<cr>
nnoremap <leader>fe :NERDTreeFocus<cr>
nnoremap <leader>gb :action Annotate<cr>
nnoremap <leader>gd :action GotoDeclaration<cr>
nnoremap <leader>gu :action ShowUsages<cr>
nnoremap <leader>q :q<cr>

" easier go to last buffer
nnoremap <leader><leader> <c-^>

" split-term
set splitright
set splitbelow

" split and move to new window
nnoremap <leader>w/ <c-w>v<c-w>l
nnoremap <leader>w- :split<cr><c-w>j

" copy current filename into system clipboard
nnoremap <silent> <leader>cf :let @* = expand("%:~")<cr>
vnoremap <c-c> "*y

" paste last contents of what was yanked regardless of what was deleted after
map <leader>y "*y
map <leader>p "*p

" add markdown syntax highlighting and spellcheck
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.md setlocal spell
au BufRead,BufNewFile *.md setlocal wrap
let g:markdown_fenced_languages = ['bash=sh', 'go', 'html', 'javascript', 'python', 'ruby', 'scala', 'vim']
map <leader>M :set syntax=markdown<cr>:set wrap<cr>:set spell<cr>

au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

map <leader>" :%s/[“”]/"/g<cr><bar>:%s/’/'/g<cr>
nmap <silent> gx :!open <cWORD><cr>

nnoremap <leader>+ <c-w>>
nnoremap <leader>- <c-w><

nnoremap <leader>fv :lua require('plugins.telescope').search_dotfiles()<cr>
nnoremap <leader>fd :lua require('plugins.telescope').search_documents()<cr>
