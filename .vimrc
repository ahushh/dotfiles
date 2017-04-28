"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Plugins """"""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Utility
" The NERD tree : A tree explorer plugin for navigating the filesystem 
" http://www.vim.org/scripts/script.php?script_id=1658
"
" The NERD Commenter : A plugin that allows for easy commenting of code for many filetypes. 
" http://www.vim.org/scripts/script.php?script_id=1218
"
" bufexplorer.zip : Buffer Explorer / Browser 
" http://www.vim.org/scripts/script.php?script_id=42
"
" taglist.vim : Source code browser (supports C/C++, java, perl, python, tcl, sql, php, etc)  
" http://www.vim.org/scripts/script.php?script_id=273
"
" a.vim : Alternate Files quickly (.c --> .h etc) 
" http://www.vim.org/scripts/script.php?script_id=31
" 
" SuperTab continued. : Do all your insert-mode completion with Tab. 
" http://www.vim.org/scripts/script.php?script_id=1643
"
" CSApprox : Make gvim-only colorschemes work transparently in terminal vim 
" http://www.vim.org/scripts/script.php?script_id=2390
"
" nextfile : open the next or previous file 
" http://www.vim.org/scripts/script.php?script_id=2605
"
""""" Syntax
" python.vim : Enhanced version of the python syntax highlighting script 
" http://www.vim.org/scripts/script.php?script_id=790
"
""""" Color scheme
" Color Sampler Pack : *NEW* [Jan 2010 Update] Top 100 Themes, GUI Menu 
" http://www.vim.org/scripts/script.php?script_id=625
"
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Внешний вид """"""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Color scheme
"if !has("gui")
    "let g:CSApprox_verbose_level = 0
    "colorscheme adrian
"else
let g:CSApprox_verbose_level = 0
colorscheme zenburn           
"endif

""""" Общее
set t_Co=256                        " 256 цветов
set nu 				                " Включаем нумерацию строк
set ruler 		    	            " Всегда показывать положение курсора
set showcmd			                " Показывать текущую незавершенную команду
set showmode			            " Показывать текущий режим
set showmatch			            " Подсвечивать скобки
"set scrolljump=20		            " Минимум 20 символов при прокрутке
"""" ! Настроить ! """""
set statusline=
"""" ! Настроить ! """""
set laststatus=2                    " Всегда отображать строку статуса

set wildmenu                        " Меню для автодополнения
set wildmode=full
""""" Gui
" Отключаем меню
set guioptions-=T                   
set guioptions-=m                   
set guioptions-=l                   
set guioptions-=L                   
set guioptions-=r                   
set guioptions-=R                   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""" Настройки """""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load ftplugins and indent files
filetype plugin on
filetype indent on
 
set pdev=samsung                    " Дефолтный принтер
set penc=utf-8                      " Дефолтная кодировка при печати

set history=500 		            " История команд
set undolevels=1000                 " Размер истории для отмены
set noswapfile		                " Отключаем swap-файлы
set nobackup		                " Не хранить бекапы
set undofile                        " Хранить историю отмены в отдельно файле
set undodir=$HOME/.vim/undo

set termencoding=utf-8	            " Дефолтная кодировка вывода на экран
set encoding=utf8                   " Дефолтная кодировка

" Список кодировок для определения
set fileencodings=utf-8,cp1251,koi8-r

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""" Основные функции """""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Подсветка синтаксиса 
syntax on			                
setlocal omnifunc=syntaxcomplete#Complete

""""" Отступы и табы
set tabstop=4			            " Кол-во пробелов, которыми отображается табуляция
set shiftwidth=4                    " Размер табуляции при нажатии на >> и << 
set expandtab			            " Преобразование табов в пробелы в режиме вставки
"set autoindent                      " Копирует отступы с предыдущей строки
set smartindent                     " "Умные" авто отступы

""""" Автодополнение
set ofu=syntaxcomplete#Complete     " Omni Completion
set completeopt=menu                " Всплывающее меню 

set complete=""                     " Автозавершение из...
set complete+=.                     " из текущего буфера
set complete+=k                     " из словаря
set complete+=b                     " из других буферов
"set complete+=t                     " из тегов

""""" Поиск
set incsearch			            " Поиск в по набору текста
set hlsearch			            " Подсветка найденного
set ignorecase			            " Игнорировать регистр при поиске
set smartcase                       " Если слово в верхнем регистре - ищет с учетом регистра, иначе - без. 

""""" Folding
set foldenable                      " Включить сворачивание блоков
"set foldmethod=syntax               " Сворачивать на основе синтаксиса
set foldmethod=indent               " отступов
"set foldmethod=marker               " маркеров.
"set foldmethod=manual               " Ручное сворачивание
"set foldlevel=1                     " Первый уровень вложенности открыт, остальные закрыты
set foldmarker=begin,end            " Маркеры начала и конца блока

""""" Строки
set wrap		    	            " Разрывать строки
set linebreak                       " Перенос по словам
"""" ! Настроить ! """""
"set formatoptions=qrn1
"set colorcolumn=85
""""" ! Настроить ! """""

""""" Остальное
set hidden		    	            " Не выгружать буфер при переключении
set ar                              " перечитываем файл, если он изменился извне

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Hot keys """"""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Буферы
" F1 - обзор буферов
nmap <F1> <Esc>:BufExplorer<cr>
vmap <F1> <esc>:BufExplorer<cr>
imap <F1> <esc><esc>:BufExplorer<cr>
" F2 - предыдущий буфер
map  <F2> :bp<cr>
vmap <F2> <esc>:bp<cr>i
imap <F2> <esc>:bp<cr>i
" F3 - следующий буфер
map  <F3> :bn<cr>
vmap <F3> <esc>:bn<cr>i
imap <F3> <esc>:bn<cr>i
" F4 - закрыть буфер
map  <F4> :bd!<cr>
vmap <F4> <esc>:bd!<cr>
imap <F4> <esc>:bd!<cr>

"""" Остальное
" Переключение в режим hex-редактора
"nnoremap <F11> :Hexmode<CR>
"inoremap <F11> <Esc>:Hexmode<CR>
"vnoremap <F11> :<C-U>Hexmode<CR> 
" Передвижение по 5 строк по Ctrl+h/j/k/l
nmap <C-H> 5h
nmap <C-J> 5j
nmap <C-K> 5k
nmap <C-L> 5l
 
" Переназначаем leader-клавишу
let mapleader = ","
" source $MYVIMRC reloads the saved $MYVIMRC
nmap <Leader>s :source $MYVIMRC
" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>e :e $MYVIMRC

" Печатать сразу две []
imap [ []<LEFT>
" Печатать сразу две ()
imap ( ()<LEFT>
" Enter - строка вниз
map <cr> o <esc>
" jj - переход в нормальный режим
imap jj <esc>
 
" F5 - запуск NERDtree
map <F5> :NERDTreeToggle<cr>
vmap <F5> <esc>:NERDTreeToggle<cr>
imap <F5> <esc>:NERDTreeToggle<cr>
" F6 - отключить подсветку поиска
map <F6> :nohls <cr>
vmap <F6> :nohls <cr>
imap <F6> :nohls <cr>
" F12 - включить-выключить браузер структуры документа (TagList)
map <F12> :TlistToggle<cr>
vmap <F12> <esc>:TlistToggle<cr>
imap <F12> <esc>:TlistToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""" Функции """""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Автоматическое chmod +x для файлов с #!/bin/* 
" -->
    function ModeChange()
      if getline(1) =~ "^#!"
        if getline(1) =~ "/bin/"
          silent !chmod a+x <afile>
        endif
      endif
    endfunction
    au BufWritePost * call ModeChange()
" <--

" Hex-режим
" -->
"command -bar Hexmode call ToggleHex()   
"function ToggleHex()
    "let l:modified=&mod;
    "let l:oldreadonly=&readonly;
    "let &readonly;=0
    "let l:oldmodifiable=&modifiable;
    "let &modifiable;=1
    "if !exists("b:editHex") || !b:editHex
        "let b:oldft=&ft;
        "let b:oldbin=&bin;
        "setlocal binary
        "let &ft;="xxd"
        "let b:editHex=1
        "%!xxd
    "else
        "let &ft;=b:oldft
        "if !b:oldbin
            "setlocal nobinary
        "endif
        "let b:editHex=0
        "%!xxd -r
    "endif
    "let &mod;=l:modified
    "let &readonly;=l:oldreadonly
    "let &modifiable;=l:oldmodifiable
"endfunction
" <--
