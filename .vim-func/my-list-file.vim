" ------------------------------------------------------------------
" функция получения всех файлов (не скрытых) в указанной директории
function! MyListFile(path)
    let arr = []
    for item in split(glob(a:path.'/*'), "\n")
        if isdirectory(item)
            try
                let arr += MyListFile(item)
            catch /.*/
                echo ['err', item]
            endtry
        else
            let arr += [item]
        endif
    endfor
    return arr
endfunction
" ------------------------------------------------------------------
