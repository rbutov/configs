set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

source ~/.nvimrc

call plug#begin(stdpath('data') . '/plugged')

" ## editor enhancements
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'ciaranm/securemodelines'

Plug 'itchyny/lightline.vim'

" ## IDE features
" tree
Plug 'scrooloose/nerdtree'
" GIT
Plug 'tpope/vim-fugitive'
" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" ## config plugins
let g:sneak#streak = 1

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1 "I (shift_i) to toggle

let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

" <leader>s for Rg search
noremap <leader>s :Rg
nnoremap <leader>e :Files<CR>
nnoremap <leader>r :Buffers<CR>

let g:fzf_layout = { 'down': '~20%' }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"function! s:list_cmd()
"  let base = fnamemodify(expand('%'), ':h:.:S')
"  return 'fd --type file --follow'
"  "return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
"endfunction
"
"command! -bang -nargs=? -complete=dir Files
"  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
"  \                               'options': '--tiebreak=index'}, <bang>0)
"

" as fzf uses fd, and to allow other aliases when shellout, from https://vi.stackexchange.com/questions/2950/bash-not-recognizing-aliases-when-run-from-vim
let $BASH_ENV="~/vim_bash"

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

