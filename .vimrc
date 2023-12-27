"
" Installation of vim-plug and initial addons is automatic
"
" For nvim:
" UNIXES:
"     mkdir -p ~/.config/nvim
"     ln -s ~/.vimrc ~/.config/nvim/init.vim
" Windows:
"     mkdir ~/AppData/Local/nvim
"     cp .vimrc ~/AppData/Local/nvim/
"     cp .config/nvim/coc-settings.json ~/AppData/Local/nvim/
"
" To delete stale addons:    :PlugClean
" To install new addons:     :PlugInstall
" To update existing addons: :PlugUpdate
" To update vim-plug:        :PlugUpgrade
"
" To install coc addons, once nodejs & npm are installed:
" :CocInstall coc-tsserver
" :CocInstall coc-eslint
" :CocInstall coc-git
" :CocInstall coc-go
" :CocInstall coc-json
" :CocInstall coc-pyright
" :CocInstall coc-react-refactor
" :CocInstall coc-snippets
" :CocInstall coc-vetur
"
" To configure coc settings:
" :CocConfig
"
" To check coc installation status:
"
" :checkhealth
"
" Don't mind the warning about tmux: https://github.com/neovim/neovim/issues/16237
"

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

"Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'neoclide/coc-snippets'
Plug 'honza/vim-snippets'

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fireplace'

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'fatih/vim-go'

Plug 'nsf/gocode'
Plug 'junegunn/fzf'

Plug 'tomasiser/vim-code-dark'
Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'spf13/vim-colors'
Plug 'flazz/vim-colorschemes'
"Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'rhysd/conflict-marker.vim'
"Plug 'jiangmiao/auto-pairs'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'tacahiroy/ctrlp-funky'
"Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/sessionman.vim'
Plug 'powerline/fonts'
Plug 'bling/vim-bufferline'
"Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'mbbill/undotree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'fholgado/minibufexpl.vim'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'jistr/vim-nerdtree-tabs'
"Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'lukelbd/vim-statusline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'preservim/tagbar'
call plug#end()

"
" nvim providers https://neovim.io/doc/user/provider.html
"
if has('nvim')
    let g:python3_host_prog = "$HOME/.pyenv/versions/nvim/bin/python"
    let g:loaded_perl_provider = 0
endif

silent! source $VIMRUNTIME/defaults.vim

let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

let g:miniBufExplAutoStart      = 1
let g:miniBufExplBRSplit        = 0
let g:miniBufExplBuffersNeeded  = 1
let g:miniBufExplMinSize        = 1
let g:miniBufExplMaxSize        = 1
let g:miniBufExplUseSingleClick = 1

let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeShowLineNumbers=1

let g:solarized_style           = 'dark'
let g:solarized_contrast        = 1
let g:solarized_termcolors      = 256
let g:solarized_termtrans       = 1
let g:solarized_bold            = 1
let g:solarized_underline       = 0
let g:solarized_contrast        = "high"
let g:solarized_visibility      = "high"

" let g:SuperTabDefaultCompletionType = "<c-n>"

let g:tex_flavor = "latex"

" Mac specific fix for function keys
map <Esc>[P <F1>
map <Esc>[Q <F2>
map <Esc>[R <F3>
map <Esc>[S <F4>

" nmap <leader>d  :read !date '+%Y%m%d %T'<CR>
nmap <leader>-  :split<CR>
nmap <leader>/  :vsplit<CR>

nmap <F3>       :NERDTreeToggle<CR>
nnoremap <F5>   :UndotreeToggle<CR>
nmap <F8>       :TagbarToggle<CR>

nmap <Leader>a" :Tabularize /"<CR>
vmap <Leader>a" :Tabularize /"<CR>
nmap <Leader>a# :Tabularize /#<CR>
vmap <Leader>a# :Tabularize /#<CR>

" copy and cut
vmap <C-c>      "+yi<ESC>
vmap <C-x>      "+c<ESC>
" vmap <C-v>      c<ESC>"+p
" imap <C-v>      <ESC>"+pa"

" Better tab experience - from https://webdevetc.com/
map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" Move cursor through long soft-wrapped lines
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

set autoindent                 " Copy indent from current line when starting a new line
set autoread                   " Reload file after changes on disk are detected
set background=dark            " Use a dark background for syntax highlight
set backspace=eol,indent,start " Make backspaces delete sensibly
set breakindent
set browsedir=buffer
set confirm                    " Ask for confirmation before doing changes
set cscopepathcomp=2           " How many components of the path to show in a list of tags.
" set cursorbind               " Bound cursor moves between windows, useful for diff
" set debug=throw
set encoding=utf-8
set expandtab                  " Convert all tabs typed to spaces, Ctrl+V<Tab> to insert a tab
set nofixeol                   " Preserve the <EOL> situation from the original file
" set nofoldenable             " Do not colapse folds
set go+=a
set grepprg=grep\ -nH\ $*
set hlsearch                   " Highlight searchs
set incsearch                  " Show matches while wrting the search
set ignorecase                 " Ignore case in searchs"
set list                       " Show special chars
set matchpairs+=<:>            " Allow % to bounce between angles too
set mouse=a                    " Enable mouse in all cases"
set nowrap                     " Do not wrap lines
set number                     " Show line numbers
set pastetoggle=<F10>
set shiftround                 " Indent/outdent to nearest tabstop
set shiftwidth=4               " Indent/outdent by four columns
set showcmd                    " Show command in the last line of the screen and number of selected lines or size in screen chars
set showtabline=2
set smartcase                  " Do not ignore case if there is a caps
set smartindent                " Do smart autoindenting when starting a new line
set smarttab                   "
set nospell                    " Do not enable spell checker by default
set tabstop=4                  " Indentation levels every four columns
set textwidth=115              " Set textwidth to 115 chars, half fullscreen console on @1680*1050
set undofile                   " Turn on the undo history
set wildmode=list:longest,full

if has("lcs-multispace")
    set listchars=multispace:--+,tab:>-,lead:.,trail:!,extends:>,precedes:<,nbsp:.
else
    set listchars=tab:>-,trail:!,extends:>,precedes:<,nbsp:.
end

if !has('nvim')
    if has("mouse_sgr")
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    end
    if !isdirectory($HOME."/.vim/undo")
        call mkdir($HOME."/.vim/undo", "", 0700)
    endif
    set completeopt=menuone,popup,noinsert
    set t_Co=256                   " Enable 256 colors to stop the CSApprox warning and make xterm vim shine
    set undodir=$HOME/.vim/undo    " Directory where the undo files will be stored
end

colorscheme peaksea
"colorscheme solarized
"if has('gui_running')
"   colorscheme molokai
"   colorscheme ps_color
"else
"   colorscheme devbox-dark-256
"   colorscheme elflord
"   colorscheme lucius
"endif

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

highlight LineNr term=bold cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=Red guibg=NONE

" Return to last position visited
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

autocmd FileChangedShell *
  \ echohl WarningMsg | echo "File changed on disk. Reloading changes..." | :e
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded."
autocmd FocusGained,BufEnter * :checktime
" autocmd FocusGained,BufEnter * :silent !
" autocmd FocusLost,WinLeave * :silent! w


"
" coc.nvim configuration from https://github.com/neoclide/coc.nvim
"

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
"set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


" lightline
let g:lightline = {
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
  \     [ 'blame' ]
  \   ],
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \ }
\ }

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}

autocmd User CocGitStatusChange {command}

" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
