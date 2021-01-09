" Plugin Management {{{
call plug#begin()
" Fern
Plug 'lambdalisue/fern.vim'
" Fern git status
Plug 'lambdalisue/fern-git-status.vim'
" Tmux
Plug 'christoomey/vim-tmux-navigator'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
" Whitespace
Plug 'ntpeters/vim-better-whitespace'
" Expand region
Plug 'terryma/vim-expand-region'
" 100+ lazy loading syntax
"Plug 'sheerun/vim-polyglot'
" fzf integration
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" float term
Plug 'voldikss/vim-floaterm'
" Color preview
Plug 'ap/vim-css-color'
" Fast movement in vim
Plug 'easymotion/vim-easymotion'
" Linting
Plug 'dense-analysis/ale'
" Aligment
Plug 'junegunn/vim-easy-align'
" Outliner for structured text
" Plug 'vim-voom/VOoM'
" Visualize undo tree
Plug 'mbbill/undotree'
" Vim prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['json', 'markdown', 'yaml', 'html'] }
" Statusline
Plug 'itchyny/lightline.vim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Surround
 Plug 'tpope/vim-surround'
" Tags
" Plug 'majutsushi/tagbar'
" Markdown
Plug 'plasticboy/vim-markdown'
" Plug 'nelstrom/vim-markdown-folding'
" For formating md tables
" Plug 'godlygeek/tabular'
" Plug 'dhruvasagar/vim-table-mode'
" Ansible
Plug 'pearofducks/ansible-vim'
" Docker
Plug 'ekalinin/Dockerfile.vim'
" Go support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" wrapper of Terminal and REPL
" Plug 'kassio/neoterm'
" Commenting
Plug 'scrooloose/nerdcommenter'
" Distraction free writing
Plug 'junegunn/goyo.vim'
" Dimm and highlight cursor line
Plug 'junegunn/limelight.vim'
" Latex
" Plug 'vim-latex/vim-latex'
" Better % matching
Plug 'andymass/vim-matchup'
" Key mapping menu
" Plug 'liuchengxu/vim-which-key'
" Rainbow Paranthesis
" Plug 'luochen1990/rainbow'
" Find and Replace
" Plug 'brooth/far.vim'
" bufkill
Plug 'qpkorr/vim-bufkill'
" Terraform
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
"Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" CSV
Plug 'chrisbra/csv.vim'
" Better f F t T
Plug 'unblevable/quick-scope'
" vim-slime
Plug 'jpalardy/vim-slime'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
call plug#end()
" }}}
" Colors {{{
silent! colorscheme dracula
" to work better with dracula
"let g:polyglot_disabled = ['yaml']
" Follow transperancy from temrinal
hi Normal guibg=NONE ctermbg=NONE
if (has("termguicolors"))
 set termguicolors
endif
" Set comment color cause default dark blue is not readable
hi Comment guifg=#cc99ff
" }}}
" UI {{{
set conceallevel=2
set number relativenumber " relative and absolute line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
" Space above/beside cursor from screen edges
set scrolloff=3
set sidescrolloff=5
set wildmenu wildmode=full
set wildignorecase
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,**/node_modules/**,**.git/**,**/target/**,**.terraform/**     " MacOSX/Linux
set encoding=utf-8
set showmatch           " highlight matching [{()}]
" }}}
" Misc {{{
if has("win32")
  set clipboard=unnamed " default register is system clipboard
else
  set clipboard=unnamedplus " default register is system clipboard
endif
" Highlight TODO in every file
augroup HiglightTODO
    autocmd!
    autocmd WinEnter,VimEnter * :silent! call matchadd('Todo', 'TODO', -1)
augroup END
syntax on
filetype indent plugin on
set hidden
set nocompatible
set history=500
"set autochdir " set pwd always to current file
set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
set backupdir=$HOME/.vim/swp/
set directory=$HOME/.vim/swp/
" Delay for leader + key waiting for another key
set timeoutlen=300
" Delay for leaving insert mode with esc
set ttimeoutlen=0
" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Prevent wrong syntax redering - may slow down
"autocmd BufEnter * :syntax sync fromstart
" }}}
" Search {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case in search patterns
set smartcase
" highlight last inserted text
nnoremap gV `[v`]
" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif
" Center searches
noremap n nzz
noremap N Nzz
" }}}
" Default Mappings {{{
let mapleader=" "
" replace currently selected text with default register without yanking it
vnoremap p "_dP
" write file with sudo
cnoreabbrev w!! w !sudo tee > /dev/null %|
" move vertically by visual line when used withput count
" and move by physical line when used with count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" Visually move lines
vmap J :m +1<CR>gv
vmap K :m -2<CR>gv
" open previously opened file
nnoremap <Leader><tab> :e#<CR>
" duplicate file
nnoremap <silent> <Leader>fd :clear<bar>silent exec "!cp '%:p' '%:p:h/%:t:r-copy.%:e'"<bar>redraw<bar>echo "Copied " . expand('%:t') . ' to ' . expand('%:t:r') . '-copy.' . expand('%:e')<cr>
" Change behaviour of Y similar to C and D
nnoremap Y y$
" Keep selection active after indenting
vmap > >gv
vmap < <gv
" Cancel search with escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
" Toogle whitespace
nnoremap <Leader>tw :set list!<CR>
" Buffer handling
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>bn :bn<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bd :BD<CR>
nnoremap <Leader>bk :BD!<CR>
nnoremap <leader>bs :w<CR>
" Redo remap
nnoremap U <C-r>
" Undotree
nmap <leader>u :UndotreeShow<CR>
nmap <leader>u :UndotreeShow<CR>
" Substitute in current file
if has("nvim")
    set inccommand=nosplit
endif
nnoremap <Leader>r :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//g<left><Left>
xnoremap <Leader>r "sy:%s/<C-r>s//g<left><Left>
" insert mode completion mappings
" project tags
inoremap <C-t>     <C-x><C-]>
" language and context aware
inoremap <C-Space> <C-x><C-o>
" current buffer
inoremap <C-b>     <C-x><C-p>
" dictionary
inoremap <C-d>     <C-x><C-k>
" file path
inoremap <C-f>     <C-x><C-f>
" whole line
inoremap <C-l>     <C-x><C-l>
" Bash readline mappings
inoremap <C-a>  <C-o>^
inoremap <C-e>  <C-o>$
inoremap <A-b>  <C-Left>
inoremap <A-f>  <C-Right>
inoremap <A-BS> <C-w>
inoremap <A-d>  <C-o>dw
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>
cnoremap <A-b>  <C-Left>
cnoremap <A-f>  <C-Right>
cnoremap <A-BS> <C-w>
cnoremap <A-d>  <C-Right><C-w>
" Quickly insert an empty new line without entering insert mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
" }}}
" Folding {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=2      " 10 nested fold max
" }}}
" Indenting {{{
set nowrap
"set tabstop=2
"set shiftwidth=2
set expandtab
set smartindent
set autoindent
" }}}
" Whitespace {{{
" Better Whitespace
" highlighting for the current line in normal mode can be disabled
let g:current_line_whitespace_disabled_soft=1
" strip all trailing whitespace everytime you save
let g:strip_whitespace_on_save = 1
" Do not ask for comfirmation
let g:strip_whitespace_confirm=0
" Strip whitelines at end of file
let g:strip_whitelines_at_eof=1
" characters for whitespaces
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
" }}}
" Windows handling {{{
" only show focused window
nnoremap <leader>on :on<CR>
"" Terminal mode:
"tnoremap <C-h> <c-\><c-n><c-w>h
"tnoremap <C-j> <c-\><c-n><c-w>j
"tnoremap <C-k> <c-\><c-n><c-w>k
"tnoremap <C-l> <c-\><c-n><c-w>l
"" Insert mode:
"inoremap <c-h> <esc><c-w>h
"imap <c-j> <esc><c-w>j
"inoremap <c-k> <esc><c-w>k
"inoremap <c-l> <esc><c-w>l
"" Visual mode:
"vnoremap <C-h> <Esc><c-w>h
"vmap <C-j> <Esc><c-w>j
"vnoremap <C-k> <Esc><c-w>k
"vnoremap <C-l> <Esc><c-w>l
"" Normal mode:
"nnoremap <C-h> <c-w>h
"nmap <C-j> <c-w>j
"nnoremap <C-k> <c-w>k
"nnoremap <C-l> <c-w>l
" Resizing
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>
" New
nnoremap <silent> <Leader>t :$tabnew<CR>
" close
nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <silent> <Leader>q :close<CR>
" }}}
" Lightline {{{
set laststatus=2
set noshowmode " do not show mode because it is shown in the status line
let g:lightline = {
      \ 'colorscheme': 'dracula',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified', 'spell' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ }
      \ }
function! LightlineFilename()
  return expand('%:p')
endfunction" }}}
" Nerdtree {{{
"" Toggle NERDTree
"nnoremap <Leader>pt :NERDTreeToggle<Enter>
"nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
"" quit vim if Nerdtree is the last buffer
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"" open NERDTree automatically
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * NERDTree
"" Jump to the main window after Nerdtree is open
"autocmd VimEnter * wincmd p
"" sync open file with NERDTree
"" " Check if NERDTree is open or active
"function! IsNERDTreeOpen()
"  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

"" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
"" file, and we're not in vimdiff
""function! SyncTree()
""  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
""    NERDTreeFind
""    wincmd p
""  endif
""endfunction
"" Highlight currently open buffer in NERDTree
""autocmd BufEnter * call SyncTree()

"" Automatically delete the buffer of the deleted file
"let NERDTreeAutoDeleteBuffer = 1
"" Remove help message
"let NERDTreeMinimalUI = 1

"let g:NERDTreeGitStatusIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ 'Ignored'   : '☒',
"    \ "Unknown"   : "?"
"    \ }
" }}}
" Goyo and limelight {{{
" Goyo and limelight integration
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" Limelight Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
" Limelight Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
" }}}
" Snippets {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "custom-snippets"]
augroup ultisnips_no_auto_expansion
    au!
    au VimEnter * au! UltiSnips_AutoTrigger
augroup END
" }}}
" Gitgutter {{{
let g:gitgutter_map_keys = 0
nmap <Leader>hn <Plug>(GitGutterNextHunk)
nmap <Leader>hp <Plug>(GitGutterPrevHunk)
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hv <Plug>(GitGutterPreviewHunk)
" }}}
" FZF {{{
nnoremap <C-p> :Files<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>fr :History<CR>
"nnoremap <leader>w :Windows<CR>
nnoremap <leader>; :BLines<CR>
nnoremap <leader>: :BTags<CR>
"nnoremap <leader>c :Commits<CR>
nnoremap <leader>ft :Filetypes<CR>
"nnoremap <leader>s :Snippets<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
  autocmd Filetype fzf noremap <buffer> <C-j> <nop>
  autocmd Filetype fzf noremap <buffer> <C-k> <nop>
endif
" }}}
" EasyMotion {{{
" Disable default mappings
let g:EasyMotion_do_mapping = 0
" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
" Move to word
map  <Leader>W <Plug>(easymotion-bd-w)
nmap <Leader>W <Plug>(easymotion-overwin-w)
" emulate vim-sneak
nmap <leader>S <Plug>(easymotion-s2)
" }}}
" EasyAlign {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" FLoaterm {{{
let g:floaterm_keymap_toggle = '<leader>f'
nnoremap <silent> <leader>fs :FloatermSend<CR>
let g:floaterm_gitcommit = 'split'
command! VF FloatermNew vifm
command! LF FloatermNew lf
" }}}
" Fern {{{

" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

" Custom settings and mappings.
let g:fern#disable_default_mappings = 1

noremap <silent> <Leader>p :Fern . -drawer -width=35 -toggle<CR><C-w>=
noremap <silent> <Leader>. :Fern %:h -drawer -width=35 -toggle<CR><C-w>=

function! FernInit() abort
  augroup FernTypeGroup
      autocmd! * <buffer>
      autocmd BufEnter <buffer> silent execute "normal \<Plug>(fern-action-reload)"
  augroup END
  nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-action-open:select)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
  nmap <buffer> <CR> <Plug>(fern-my-open-expand-collapse)
  nmap <buffer> n <Plug>(fern-action-new-path)
  nmap <buffer> D <Plug>(fern-action-trash)
  nmap <buffer> m <Plug>(fern-action-move)
  nmap <buffer> M <Plug>(fern-action-rename)
  nmap <buffer> c <Plug>(fern-action-copy)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> t <Plug>(fern-action-mark:toggle)
  nmap <buffer> s <Plug>(fern-action-open:split)
  nmap <buffer> v <Plug>(fern-action-open:vsplit)
  nmap <buffer> <nowait> i <Plug>(fern-action-hidden:toggle)
  nmap <buffer><nowait> u <Plug>(fern-action-leave)
  nmap <buffer><nowait> e <Plug>(fern-action-enter)
  nmap <buffer> q :<C-u>quit<CR>
endfunction

augroup FernGroup
  autocmd!
  autocmd FileType fern call FernInit()
augroup END

let g:fern#mark_symbol                       = '●'
let g:fern#renderer#default#collapsed_symbol = '▷ '
let g:fern#renderer#default#expanded_symbol  = '▼ '
let g:fern#renderer#default#leading          = ' '
let g:fern#renderer#default#leaf_symbol      = ' '
let g:fern#renderer#default#root_symbol      = '~ '

let g:fern_git_status#disable_ignored    = 1
let g:fern_git_status#disable_untracked  = 1
let g:fern_git_status#disable_submodules = 1

" }}}
" Tmux {{{
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <leader>l :TmuxNavigatePrevious<cr>
" }}}
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
let g:deoplete#enable_at_startup = 1
call deoplete#initialize()
" }}}
" Terrafrom {{{
" (Optional)Remove Info(Preview) window
set completeopt-=preview
" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1
" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0
" }}}
" Markdown {{{
" Indet lists with 2 spaces
let g:vim_markdown_new_list_item_indent = 0
" Open files followed by link in new tab
let g:vim_markdown_edit_url_in = 'tab'
let g:markdown_fenced_languages = ['bash=sh', 'css', 'javascript', 'js=javascript', 'json=javascript', 'xml', 'dockerfile', 'terraform', 'java']
" }}}
" Quickscope {{{
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_buftype_blacklist = ['terminal', 'nofile']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
" }}}
" Python {{{
au FileType python setl shiftwidth=4 tabstop=4
" }}}
" Run files {{{
nmap <buffer> <leader>ep <Esc>:w<CR>:!clear;python %<CR>
nmap <buffer> <leader>eb <Esc>:w<CR>:!clear;bash %<CR>
" }}}
" YAML {{{
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 foldmethod=indent expandtab
" }}}
" JSON {{{
autocmd FileType json setlocal ts=4 sts=4 sw=4 foldmethod=syntax expandtab
let g:vim_json_syntax_conceal = 0
" }}}
" vim-slime {{{
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
" If you generally run vim in a split tmux window with a REPL in the other pane:
let g:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
" default keybindings
let g:slime_no_mappings = 0
xmap <c-c><c-c> <Plug>SlimeRegionSend
nmap <c-c><c-c> <Plug>SlimeParagraphSend
nmap <c-c>v     <Plug>SlimeConfig
" neovim <c-c> conflicts with vim-slime
nnoremap <c-c> nop
" }}}
" Fugitive {{{
" Conflict Resolution
nnoremap <leader>gc:Gvdiff!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
" }}}
" Indentline {{{
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
" }}}
" Ale {{{
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
" }}}
" Indenting {{{
" }}}
" vim:foldmethod=marker:foldlevel=0
