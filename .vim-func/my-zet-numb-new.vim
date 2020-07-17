" ------------------------------------------------------------------
" генерация нового идентификатора для zettelkasten
function! MyZetNumbNew()
    let fls = MyListFile(getcwd())
    if len(fls) > 500 | return 'count(files) > 500' | endif
    let arr = []
    for item_file in fls
        for item_line in readfile(item_file)
            let mtch = matchstr(item_line, 'ZET_NUMB_[0-9][0-9][0-9][0-9][0-9]')
            if !empty(mtch) | let arr += [mtch] | endif
        endfor
    endfor
    if empty(arr) | let arr = [ 'ZET_NUMB_00000' ] | endif
    let temp = sort(arr)[-1][-5:-1]                     " сортируем > берем старший > только числовую часть ~~          '00001'
    let temp = printf('%5d', str2nr(temp) + 1)          " строку в число > инкрементируем > в строку        ~~          '    2'
    let temp = 'ZET_NUMB_'.substitute(temp,' ','0','g') " пробелы в нули > формируепм нужную строку         ~~ 'ZET_NUMB_00002'
    return temp
endfunction
" ------------------------------------------------------------------
