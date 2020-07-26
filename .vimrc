set number          " нумерация строк
set relativenumber  " номера строк относительные
set shortmess-=S    " при поиске отображать количество (vim > 8.1.1270, nvim > 0.4.0)
set encoding=UTF-8  " кодировка для vim иконок (в nvim такая по умолчанию)

set hlsearch        " подсветка результатов поиска
set incsearch       " подсветка поиска в процессе набора
set cursorline      " подсветка текущей строки

" BEGIN табуляция
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
" END табуляция

" BEGIN история изменения
set undofile
set undodir=/tmp/.vim_undo
set undolevels=1000
set undoreload=10000
" END история изменения

" BEGIN служебные файлы
set nobackup        " отключение backup file
set noswapfile      " отключение swap   file
" set noundofile      " отключение undo   file
" END служебные файлы

" BEGIN русская раскладка
" set keymap=russian-jcukenwin
" set iminsert=0
" set imsearch=0
" highlight lCursor guifg=NONE guibg=Cyan
" END русская раскладка
" ------------------------------------------------------------------
" Начало блока плагинов

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" оформление
Plug 'morhetz/gruvbox'                                  " цветовая тема
Plug 'vim-airline/vim-airline'                          " строка статуса
Plug 'airblade/vim-gitgutter'                           " git подсветка изменений

" функционал
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'                      " nerdtree + git
Plug 'ryanoasis/vim-devicons'                           " nerdtree + icons
Plug 'scrooloose/nerdcommenter'                         " комментирование
Plug 'kien/ctrlp.vim'                                   " нечеткий поиск по файлам проекта
Plug 'dyng/ctrlsf.vim'                                  " поиск и замена по нескольким файлам
Plug 'tpope/vim-fugitive'                               " git команды (:Gstatus :Gdiff)
Plug 'mattn/emmet-vim'                                  " emmet
Plug 'vim-scripts/LargeFile'                            " большие файлы
Plug 'junegunn/fzf.vim'                                 " fzf поиск
Plug 'mechatroner/rainbow_csv'                          " tsv файлы
Plug 'sheerun/vim-polyglot'                             " подсветка языков
Plug 'dhruvasagar/vim-table-mode'                       " работа с таблицами

" Языки
" Plug 'hail2u/vim-css3-syntax'                           " CSS
" Plug 'cakebaker/scss-syntax.vim'                        " SASS
" Plug 'StanAngeloff/php.vim'                             " PHP       (для синтаксиса. лучше подсветка штатных констант)
" Plug 'othree/html5.vim'                                 " HTML      (для синтаксиса. без него комментарии все ломают в php файлах)
" Plug 'pangloss/vim-javascript'                          " JS
" Plug 'evidens/vim-twig'                                 " TWIG      (шаблонизатор для php) (без него подсветки просто нет)
" Plug 'shawncplus/phpcomplete.vim'
" Plug 'dsawardekar/wordpress.vim'                        " WP        (для синтаксиса)
" Plug 'neovimhaskell/haskell-vim'                        " HASKELL
" Plug 'posva/vim-vue'                                    " VUE
" Plug 'maxmellon/vim-jsx-pretty'                         " JSX       (react native)

" Plug 'prettier/vim-prettier'                            " автоформатирование кода
" Plug 'mhinz/vim-startify'                               " сессии и стартовый экран (видны файлы, открытые в прошлый раз)
" Plug 'brooth/far.vim'                                   " поиск и замена по нескольким файлам (использую ctrlSF)
" Plug 'tpope/vim-surround'                               " работа с кавычками, скобками и тегами
" Plug 'Valloric/YouCompleteMe'                           " автокомплит (для работы необходима КОМПИЛЯЦИЯ)
" Plug 'jiangmiao/auto-pairs'                             " авто закрытие кавычек
" Plug 'easymotion/vim-easymotion'                        " быстрые прыжки по коду (отходят от vim стиля перемещения)
" Plug 'rking/ag.vim'                                     " поиск по проекту
" Plug 'terryma/vim-multiple-cursors'                     " мультикурсор
" Plug 'xolox/vim-session'                                " сессии
" Plug 'xolox/vim-misc'                                   " - зависимость

" if has('nvim')                                          " только для neovim
  " " автокомплит (нужен python3 + манипуляции с pip)
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " let g:deoplete#enable_at_startup = 1
" endif

call plug#end()
" Конец блока плагинов
" ------------------------------------------------------------------
" горячие клавиши
let mapleader=" "

" n - древоподобный просмотр файлов
map <leader>nn :NERDTreeToggle<CR>
map <leader>ne :Explore<CR>

" p - прямое указание открываемого пути
map <leader>pp :CtrlP<CR>
map <leader>pb :CtrlPBuffer<CR>
map <leader>pf :FZF<CR>

" g - git операции
map <leader>gs :Gstatus<CR><C-w>o
map <leader>gd :Gdiff HEAD<CR>
map <leader>gl :Glog<CR>

" s - работа с сессиями
" map <leader>ss :mksession! ./.proj.vim<CR>
" map <leader>sl :source     ./.proj.vim<CR>

" b - работа с вкладками (на самом деле буферами)
" map <leader>tr :bp<CR>
" map <leader>tt :bn<CR>
" map <leader>td :bp<CR>:bd #<CR>
" map <leader>td :call MyBufferDel()<CR>
map <leader>bb :call MyBufferDel()<CR>

" f - работа с поисковыми движками
map <leader>ff :CtrlSF<space>
map <leader>ft :CtrlSFToggle<CR>

" ,, (развернуть emmet команду)
let g:user_emmet_leader_key=','
let g:user_emmet_settings = {
\   'php' : { 'quote_char': "'" },
\}

" в режиме вставки, вставка меток 'дата' и 'дата+время' (Ctrl+D+D, Ctrl+T+T)
imap <silent> <C-D><C-D> <C-R>=strftime("%F")<CR>
imap <silent> <C-T><C-T> <C-R>=strftime("[%F %R]")<CR>

" в режиме вставки номер новой заметки zettelkasten
imap <silent> <C-Z><C-N> <C-R>=MyZetNumbNew()<CR>

" однократное нажатие в нормальном режиме для табуляции
nnoremap <silent> > >>
nnoremap <silent> < <<

" выделение не сбрасывается в визуальном режиме при табуляции
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" ------------------------------------------------------------------
" доводка плагинов

colorscheme gruvbox                            " gruvbox    - тема
set background=dark                            " gruvbox    - темный режим
let g:airline#extensions#tabline#enabled = 1   " airline    - отображать вкладки
let g:airline_powerline_fonts = 1              " airline    - использовать шрифты powerline
let g:ctrlp_show_hidden = 1                    " ctrlp      - отображать скрытые файлы
let g:NERDSpaceDelims = 1                      " commenting - пробел между комментом и данными
let g:NERDTreeWinSize = 50                     " NERDtree   - ширина окна с деревом
let g:user_emmet_mode = 'n'                    " emmet      - только в NORMAL режиме (иначе неожиданные глюки при печати)

let g:ctrlsf_ignore_dir = ['bower_components', 'node_modules', 'package-lock.json']

let g:netrw_banner=0
let g:netrw_liststyle=3
" ------------------------------------------------------------------
" свои скрипты на vimscript
let $TEMP = '~/.vim-func/my-buffer-del.vim'     | source $TEMP
let $TEMP = '~/.vim-func/my-list-file.vim'      | source $TEMP
let $TEMP = '~/.vim-func/my-zet-numb-new.vim'   | source $TEMP
" ------------------------------------------------------------------
" переоткрытие файла в нужной кодировке
set wildmenu
set wcm=<Tab>
menu Encoding.utf-8        :e ++enc=utf8 <CR>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.windows-1252 :e ++enc=cp1252 ++ff=dos<CR>
menu Encoding.cp866        :e ++enc=cp866  ++ff=dos<CR>
menu Encoding.koi8-r       :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.koi8-u       :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>
" ------------------------------------------------------------------
" при открытии файлов календаря активировать свою подсветку
au BufNewFile,BufRead *.cal syn keyword GruvboxOrangeBold Пн Вт Ср Чт Пт Сб Вс
au BufNewFile,BufRead *.cal syn match GruvboxBlueSign  / h /
au BufNewFile,BufRead *.cal syn match GruvboxGray      / o /
au BufNewFile,BufRead *.cal syn match GruvboxRedBold   / e /
au BufNewFile,BufRead *.cal syn match GruvboxGreenBold / a /
" ------------------------------------------------------------------
