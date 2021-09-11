call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  " https://medium.com/swlh/ultimate-vim-typescript-setup-35b5ac5c8c4e
  Plug 'pangloss/vim-javascript'    " JavaScript support
  Plug 'leafgarland/typescript-vim' " TypeScript syntax
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
  Plug 'jparise/vim-graphql'        " GraphQL syntax
  Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'ap/vim-buftabline'
call plug#end()

set nopaste

set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
let g:coc_global_extensions = [ 'coc-tsserver' ]

colorscheme molokai

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'background': 'light',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ } 

" https://github.com/itchyny/lightline.vim/issues/489
" https://github.com/itchyny/lightline.vim
augroup NERD
  au!
  autocmd VimEnter * NERDTree
  autocmd VimEnter * wincmd p
  autocmd VimEnter * call lightline#update()
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  autocmd FileType nerdtree setlocal relativenumber
  let NERDTreeMinimalUI = 1
  let NERDTreeDirArrows = 1
  let NERDTreeShowHidden = 1
  nmap <F1> :NERDTreeToggle<CR>
augroup END

