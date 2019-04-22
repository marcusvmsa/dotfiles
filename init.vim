" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'dikiaap/minimalist'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'airblade/vim-gitgutter'
Plug 'wakatime/vim-wakatime'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'jparise/vim-graphql'
Plug 'epilande/vim-es2015-snippets', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'epilande/vim-react-snippets',  { 'for': ['javascript', 'javascript.jsx'] }
Plug 'SirVer/ultisnips'
" Initializr plugin system

call plug#end()

set number
set background=dark
set termguicolors
let g:quantum_italics=1
colorscheme gruvbox
let base16colorspace=256

" Use a slightly slimmer error pointer
let g:ale_sign_error = '✖'
hi ALEErrorSign guifg=#DF8C8C
let g:ale_sign_warning = '⚠'
hi ALEWarningSign guifg=#F2C38F
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\  '*': ['trim_whitespace'],
\  'typescript': ['tslint', 'eslint'],
\  'javascript': ['prettier', 'eslint']
\}

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

let g:gruvbox_contrast_dark = 'soft'
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

let mapleader=","

nmap <leader>w :w!<cr>
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <leader>p :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 5
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>

set nowrap
set runtimepath+=~/.config/nvim/UltiSnips
" let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/snips', 'UltiSnips']

let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
