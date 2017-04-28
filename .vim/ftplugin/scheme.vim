setlocal tabstop=2			            " Кол-во пробелов, которыми отобрадается табуляция
setlocal shiftwidth=2                    " Размер табуляции при нажатии на >> и << 
setlocal expandtab			            " Преобразование табов в пробелы в режиме вставки
 
" Не печатать сразу две ()
imap ( (
" F10 - Запуск mzscheme
map <F10> :w <cr> :!mzscheme -f % <cr>
" F9 - Запуск mit-scheme
map <F9> :w <cr> :!mit-scheme --quiet --load %<cr> 
