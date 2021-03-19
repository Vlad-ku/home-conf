" ------------------------------------------------------------------
" Начало блока плагинов

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'                                  " gruvbox - цветовая тема
Plug 'airblade/vim-gitgutter'                           " gitgutter - подсветка изменений (слева)
Plug 'vim-airline/vim-airline'                          " airline - строка статуса
let g:airline#extensions#tabline#enabled = 1            " airline - отображать вкладки
let g:airline_powerline_fonts = 1                       " airline - использовать шрифты powerline
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " nerdtree
let g:NERDTreeWinSize = 50                              " nerdtree - ширина окна с деревом
Plug 'Xuyuanp/nerdtree-git-plugin'                      " nerdtree+git
Plug 'ryanoasis/vim-devicons'                           " nerdtree+icons
Plug 'vlad-ku/nerdtree-execute'                         " nerdtree+(открытие бинарных файлов в просмоторщике по умолчанию)
Plug 'scrooloose/nerdcommenter'                         " commenting - комментирование
let g:NERDSpaceDelims = 1                               " commenting - пробел между комментом и данными
Plug 'tpope/vim-fugitive'                               " git команды (:Gstatus :Gdiff)
Plug 'vim-scripts/LargeFile'                            " большие файлы
Plug 'kien/ctrlp.vim'                                   " ctrlp - нечеткий поиск файлов
let g:ctrlp_show_hidden = 1                             " ctrlp - отображать скрытые файлы
Plug 'junegunn/fzf.vim'                                 " fzf - нечеткий поиск файлов
Plug 'dhruvasagar/vim-table-mode'                       " работа с таблицами (автоформатирование)
" Plug 'mattn/emmet-vim'                                  " emmet
" let g:user_emmet_leader_key='<C-Z>'                     " emmet - разворачивать по `<C-Z>,`
" let g:user_emmet_settings = {'php':{'quote_char':"'"}}  " emmet - для php используем одинарные кавычки
Plug 'sheerun/vim-polyglot'                             " polyglot - подсветка всех языков
Plug 'dyng/ctrlsf.vim'                                  " ctrlsf - поиск и замена по нескольким файлам
let g:ctrlsf_ignore_dir = [ 'bower_components', 'node_modules', 'package-lock.json' ]
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }  " prettier - автоформатирование кода при сохранении
" let g:prettier#autoformat_require_pragma = 0            " prettier - разрешить автоформатирование файлов, не содержащих комментарией с тегом @prettier
" let g:prettier#autoformat_config_present = 1            " prettier - автоформатирование включено, только когда есть конфиг в проекте

" BEGIN автокомплит
Plug 'honza/vim-snippets'                               " комплект предзаготовленных сниппетов
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " coc - модный автокомплит как VSCode
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-prettier',
            \ 'coc-emmet',
            \ 'coc-tsserver',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-json',
            \ 'coc-pyright',
            \ 'coc-phpls',
            \ 'coc-sh',
            \ 'coc-vimlsp',
            \ ]

" `ENTER` - разворачивание сниппета или подсказки (+ делает точку разрыва для отмены)
" работает и без слешей в строке, но в доках на coc все служебные сочетания так обозначены, будем следовать
inoremap <expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"

" `CTRL+SPACE` - обновление окна автокомплита (в vim и nvim разное поведение)
if has('nvim')
    inoremap <expr> <c-space> coc#refresh()
else
    inoremap <expr> <c-@> coc#refresh()
endif

" `K` - открытие справки для функции (дополнение штатного функционала)
nnoremap K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!'.&keywordprg." ".expand('<cword>')
    endif
endfunction
" BEGIN автокомплит

call plug#end()

" Конец блока плагинов
" ------------------------------------------------------------------
" настройки ядра
colorscheme gruvbox " можно вызывать только после завершения блока плагинов
set background=dark " в vim без этого открывается светлая тема

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
" ------------------------------------------------------------------
" горячие клавиши
let mapleader=" "

" n - древоподобный просмотр файлов
map <leader>nn :NERDTreeToggle<CR>

" p - прямое указание открываемого пути
map <leader>pp :CtrlP<CR>
map <leader>pf :FZF<CR>

" g - git операции
map <leader>gs :Gstatus<CR><C-w>o
map <leader>gd :Gdiff HEAD<CR>
map <leader>gc :Git commit -m 
map <leader>gp :Git push

" b - вкладки (на самом деле буферы)
map <leader>bp :bp<CR>
map <leader>bn :bn<CR>
map <leader>bb :call MyBufferDel()<CR>

" f - поисковые движки
map <leader>ff :CtrlSF<space>
map <leader>ft :CtrlSFToggle<CR>

" r - запуск кода
map <leader>rp :!python3 "%"<CR>
map <leader>rb :!bash "%"<CR>

" a - автокомплит
map <leader>as :CocCommand snippets.editSnippets<CR>
map <leader>ac :CocConfig<CR>
"
map <leader>ae :CocEnable<CR>
map <leader>ad :CocDisable<CR>
"
map <leader>af :CocCommand<CR>
map <leader>ag :CocAction<CR>
map <leader>ar <Plug>(coc-rename)
map <leader>aj :CocCommand prettier.formatFile<CR>


" INSERT номер новой заметки zettelkasten
" inoremap <silent> <expr> <C-Z><C-N> MyZetNumbNew()

" INSERT вставка меток 'дата' и 'дата+время' (Ctrl+D+D, Ctrl+T+T)
inoremap <silent> <expr> <C-D><C-D> strftime("%F")
inoremap <silent> <expr> <C-T><C-T> strftime("[%F %R]")

" NORMAL+VISUAL перемещение по виртуальным строкам (режим переноса строк)
 noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
 noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" NORMAL однократное нажатие для табуляции
nnoremap <silent> > >>
nnoremap <silent> < <<

" VISUAL выделение не сбрасывается при изменении табуляции
vnoremap <silent> > >gv
vnoremap <silent> < <gv
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
" свои скрипты на vimscript
let $TEMP = '~/.vim-func/my-buffer-del.vim'     | source $TEMP
" let $TEMP = '~/.vim-func/my-list-file.vim'      | source $TEMP
" let $TEMP = '~/.vim-func/my-zet-numb-new.vim'   | source $TEMP
" ------------------------------------------------------------------
" при открытии файлов календаря активировать свою подсветку
au BufNewFile,BufRead *.cal syn keyword GruvboxOrangeBold Пн Вт Ср Чт Пт Сб Вс
au BufNewFile,BufRead *.cal syn match GruvboxBlueSign  / h /
au BufNewFile,BufRead *.cal syn match GruvboxGray      / o /
au BufNewFile,BufRead *.cal syn match GruvboxRedBold   / e /
au BufNewFile,BufRead *.cal syn match GruvboxGreenBold / a /
au BufNewFile,BufRead *.cal syn match GruvboxAquaBold  / s /
" ------------------------------------------------------------------
